*** Settings ***
Library  Selenium2Library

*** Variables ***
${RS_LANDING_PAGE_VERIFY} =  find what's next.
${RS_SEARCH_TERM_LOCATE} =  id=titleTags
${RS_SEARCH_LOCATION_LOCATE} =  id=locationTags
${RS_CLICK_SEARCH_LOCATE} =  xpath=.//*[@id='locationTags']//following-sibling::a
${RS_URL} =  https://www.randstadusa.com/
#${RS_LIST} = xpath=//ul[@id,'ui-id-']
${RS_SUGEST} =  xpath=//ul[contains(@id,'ui-id-')]/li/a
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
    #ToDo: it would be better to use the autocompleet than over ride the search term
    #focus  ${RS_SEARCH_LOCATION_LOCATE}
    #input text  ${RS_SEARCH_LOCATION_LOCATE}  ${SEARCH_LOCATION}
    #mouse over  ${RS_SEARCH_LOCATION_LOCATE}
    #focus  ${RS_SEARCH_LOCATION_LOCATE}
    #press key  ${RS_SEARCH_LOCATION_LOCATE}  \\25
    #WAIT UNTIL PAGE CONTAINS ELEMENT  ${RS_SUGEST}
    #click link  ${RS_SUGEST}
    #click link  ${RS_CLICK_SEARCH_LOCATE}