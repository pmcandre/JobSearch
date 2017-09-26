*** Settings ***
Library  Selenium2Library
Resource  ../CommonExcel.robot

*** Variables ***
${CC_Loaded} =  xpath=//div[@class='job-listing-container']
${CC_HEADLINE_L} =  ]//div[@class='job-title']/a
${CC_Location_L} =  ]//div[@class='location']
${CC_Type_L} =  ]//div[@class='wage']/span
${CC_Wage_L} =  ]//div[@class='wage']
${CC_PostingCount_L} =  //div[@class='job-listing-container']/div



*** Keywords ***

Verify Page Loaded
    WAIT UNTIL PAGE CONTAINS ELEMENT  ${CC_Loaded}

Get Data
    CommonExcel.Open Excel File
    ${NumPosting} =  get matching xpath count  ${CC_PostingCount_L}
    :FOR  ${Index}  IN RANGE  1  ${NumPosting}+1
    \  Continue For Loop If  ${Index}==5
    \  ${Posting.Headline} =  get text  ${CC_Loaded}/div[${Index}${CC_HEADLINE_L}
    \  ${Posting.Location} =  get text  ${CC_Loaded}/div[${Index}${CC_Location_L}
    \  ${Posting.Type} =  get text  ${CC_Loaded}/div[${Index}${CC_Type_L}
    \  ${Posting.Pay} =  get text  ${CC_Loaded}/div[${Index}${CC_Wage_L}
    \  ${Posting.URL} =  get element attribute  ${CC_Loaded}/div[${Index}${CC_HEADLINE_L}@href
    \  Log Variables
    \  CommonExcel.Log results  &{Posting}

    CommonExcel.Save Excel File


Debug Just log results
    log variables
    CommonExcel.Open Excel File
    CommonExcel.Log results  &{Posting}
    CommonExcel.Save Excel File