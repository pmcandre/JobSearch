*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Begin Web Test
    @{DATE} =  get time  year month day
    Open Browser  about:blank  ${BROWSER}
    maximize browser window
End Web Test
    close browser
