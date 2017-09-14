*** Settings ***
Library  Selenium2Library

*** Variables ***
${RS_LANDING_PAGE_VERIFY} =  find what's next.
${RS_SEARCH_TERM_LOCATE} =  id=titleTags
${RS_SEARCH_LOCATION_LOCATE} =  id=locationTags
${RS_CLICK_SEARCH_LOCATE} =  xpath=.//*[@id='locationTags']//following-sibling::a
${RS_URL} =  https://www.randstadusa.com/
${RS_SEARCH_LOCATION} =  Bolingbrook, Illinois

*** Keywords ***
Load Landing Page
    #Log  ${RS_URL}
    log variables
    go to  ${RS_URL}
Verify Page Loaded
    log  ${RS_LANDING_PAGE_VERIFY}
    WAIT UNTIL PAGE CONTAINS  ${RS_LANDING_PAGE_VERIFY}
Search for job
    input text  ${RS_SEARCH_TERM_LOCATE}  ${SEARCH_TERM}
    input text  ${RS_SEARCH_LOCATION_LOCATE}  ${RS_SEARCH_LOCATION}
    click link  ${RS_CLICK_SEARCH_LOCATE}