*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    maximize browser window
End Web Test
    close browser
