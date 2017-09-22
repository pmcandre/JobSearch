*** Settings ***
Library  Selenium2Library

*** Variables ***
${CC_LANDING_PAGE_VERIFY} =  xpath=//*[@id='nav-logo']/img
${CC_SEARCH_TERM_LOCATE} =  id=global-search-terms
${CC_SEARCH_LOCATION_LOCATE} =  id=global-search-location
${CC_CLICK_SEARCH_LOCATE} =  id=global-search
${CC_URL} =  https://www.cybercoders.com/

*** Keywords ***
Load Landing Page
    go to  ${CC_URL}
Verify Page Loaded
    WAIT UNTIL PAGE CONTAINS ELEMENT  ${CC_LANDING_PAGE_VERIFY}
Search for job
    input text  ${CC_SEARCH_TERM_LOCATE}  ${SEARCH_TERM}
    input text  ${CC_SEARCH_LOCATION_LOCATE}  ${SEARCH_LOCATION}
    click link  ${CC_CLICK_SEARCH_LOCATE}