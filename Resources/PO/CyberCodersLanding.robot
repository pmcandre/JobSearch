*** Settings ***
Library  Selenium2Library

*** Variables ***
${LANDING_PAGE_VERIFY} =  xpath=.//*[@id='nav-logo']/img
${SEARCH_TERM_LOCATE} =  id=global-search-terms
${SEARCH_LOCATION_LOCATE} =  id=global-search-location
${CLICK_SEARCH_LOCATE} =  id=global-search
${URL} =  https://www.cybercoders.com/

*** Keywords ***
Load Landing Page
    go to  ${URL}
Verify Page Loaded
    WAIT UNTIL PAGE CONTAINS ELEMENT  ${LANDING_PAGE_VERIFY}
Search for job
    input text  ${SEARCH_TERM_LOCATE}  ${SEARCH_TERM}
    input text  ${SEARCH_LOCATION_LOCATE}  ${SEARCH_LOCATION}
    click link  ${CLICK_SEARCH_LOCATE}