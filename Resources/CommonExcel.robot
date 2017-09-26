*** Settings ***
Library  ExcelLibrary


*** Variables ***
#${EXCEL_PATH} =  C:\\development\\robot-scripts\\JobSearch\\Results\\JobSearch.xls
#${EXCEL_PATH3} =  C:\\development\\robot-scripts\\JobSearch\\Results\\JobSearch3.xls
#${RowNumber} =  1
@{SheetNames}
${ColumnCount}
${RowCount}

*** Keywords ***
Open Excel File
    set test variable  ${path_open}  Results\\JobSearch.xls
    Open Excel Current Directory  ${path_open}

Log Results
    [Arguments]  &{RowContents}
    log variables
    @{SheetNames} =  Get Sheet Names
    log many
    ${ColumnCount} =  ExcelLibrary.Get Column Count  Posting
    log  ${ColumnCount}
    ${RowCount} =  ExcelLibrary.Get Row Count  @{SheetNames}[0]
    Log  ${RowCount}
    ExcelLibrary.Put String To Cell  @{SheetNames}[0]  0  ${RowNumber}  ${RowNumber}
    ExcelLibrary.Put String To Cell  Posting  1  ${RowNumber}  2
    ExcelLibrary.Put String To Cell  Posting  3  ${RowNumber}  &{RowContents}[Headline]
    ExcelLibrary.Put String To Cell  Posting  4  ${RowNumber}  &{RowContents}[Location]
    ExcelLibrary.Put String To Cell  Posting  5  ${RowNumber}  &{RowContents}[Pay]
    ExcelLibrary.Put String To Cell  Posting  6  ${RowNumber}  &{RowContents}[Type]
    ExcelLibrary.Put String To Cell  Posting  7  ${RowNumber}  &{RowContents}[URL]
    ${RowNumber} =  evaluate  ${RowNumber}+1
    set global variable  ${RowNumber}  ${RowNumber}
    log  ${RowNumber}
Save Excel File
    @{date} =  get time  year month day
    set test variable  ${path_close}  Results\\JobSearch@{date}[0]@{date}[1]@{date}[2].xls
    ExcelLibrary.Save Excel Current Directory  ${path_close}


Debug Excel Open
    set test variable  ${path_open}  Results\\JobSearch.xls
    Open Excel Current Directory  ${path_open}
    ${RowCount} =  ExcelLibrary.Get Row Count  Posting
    Log  ${RowCount}
    @{Date} =  get time  year month day
    set test variable  ${path_close}  Results\\JobSearch@{date}[0]@{date}[1]@{date}[2].xls
    #set test variable  ${path_close}  JobSearch@{date}[0]@{date}[1]@{date}[2].xls
    #set test variable  ${path_close}  Results\\JobSearch@{date}[1]@{date}[2].xls
    log  ${path_close}
    ExcelLibrary.Put String To Cell  Posting  1  1  2

    ExcelLibrary.Save Excel Current Directory  ${path_close}







