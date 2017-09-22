*** Settings ***
Library  Selenium2Library
Resource  ../CommonExcel.robot

*** Variables ***
${CC_Loaded} =  xpath=//div[@class='job-listing-container']
${CC_HEADLINE_L} =  xpath=//div[@class='job-listing-container']/div[1]//div[@class='job-title']/a
${CC_Location_L} =  xpath=//div[@class='job-listing-container']/div[1]//div[@class='location']
${CC_Type_L} =  xpath=//div[@class='job-listing-container']/div[1]//div[@class='wage']/span
${CC_Wage_L} =  xpath=//div[@class='job-listing-container']/div[1]//div[@class='wage']



*** Keywords ***

Verify Page Loaded
    WAIT UNTIL PAGE CONTAINS ELEMENT  ${CC_Loaded}

Get Data
    CommonExcel.Open Excel File
    ${Posting.Headline} =  get text  ${CC_HEADLINE_L}
    ${Posting.Location} =  get text  ${CC_Location_L}
    ${Posting.Type} =  get text  ${CC_Type_L}
    ${Posting.Pay} =  get text  ${CC_Wage_L}
    ${Posting.URL} =  get element attribute  ${CC_HEADLINE_L}@href
    Log Variables
    CommonExcel.Log results  &{Posting}
    CommonExcel.Save Excel File


Debug Just log results
    log variables
    CommonExcel.Open Excel File
    CommonExcel.Log results  &{Posting}
    CommonExcel.Save Excel File