*** Settings ***
Library  DatabaseLibrary
Library  String
Library  Dialogs
Library  DatabaseLibrary
Library  String
Resource  ../Data/SqlData.robot
Resource  ./CommonExcel.robot

*** Variables ***


*** Keywords ***

Connect to DB
    @{DATE} =  get time  year month day
    set global variable  @{DATE}
    log many  @{DATE}
    Connect To Database Using Custom Params  pyodbc  "DRIVER={ODBC Driver 13 for SQL Server}; SERVER=${DB_HOST}; DATABASE=${DB_NAME}; Trusted_Connection=yes;"

#Log Posting table Row Count
#    ${rowcount} =  row count  Select * From Postings
#    set global variable  ${POSING_KEY}  ${rowcount}
#    log  ${rowcount}

Insert Unique Posting
    [Arguments]  &{row_contents}
    #@{DATE} =  get time  year month day
    #set global variable  @{DATE}  @{DATE}
    ${posting_id} =  Query  select max(PostingID) from Posting
    log  ${posting_id}
    log variables
    run keyword if  ${posting_id[0][0]}==${None}  Posting Key Is One
    ...  ELSE  Posting Key Is Next  ${posting_id}
    log  ${posting_id}
    log  ${POSING_KEY}
    ${today} =  catenate  SEPARATOR=/  @{DATE}[0]  @{DATE}[1]  @{DATE}[2]
    ${insert_data} =  catenate  SEPARATOR=,  ${POSING_KEY}  ${row_contents.RecruiterID}  Null
    ...  '${row_contents.Headline}'  '${row_contents.Location}'  '${row_contents.Type}'  '${row_contents.Pay}'
    ...  '${row_contents.URL}'  '${today}'

    execute sql string  Insert into Posting values (${insert_data})
    CommonExcel.Log results  &{row_contents}

Insert New Posting
    [Arguments]  &{Row_Contents}
    ${number_match} =  row count  Select * from Posting where URL='${Row_Contents.URL}'
    log  ${number_match}
    run keyword if  ${number_match}==0  insert unique posting  &{RowContents}

Posting Key Is One
    ${POSING_KEY} =  evaluate  1
    log  ${POSING_KEY}
    ${POSING_KEY} =  set global variable  ${POSING_KEY}

Posting Key Is Next
    [arguments]  ${posting_id}
    ${POSING_KEY} =  evaluate  ${posting_id[0][0]}+1
    log  ${POSING_KEY}
    ${POSING_KEY} =  set global variable  ${POSING_KEY}

Disconnect from DB
    Disconnect from Database