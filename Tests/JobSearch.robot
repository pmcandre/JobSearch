*** Settings ***
Documentation  This test suite opens each web page and does a job search
Resource  ../Resources/JobSearchApp.robot
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/CommonExcel.robot
Resource  ../Resources/CommonSQL.robot

Test Setup  CommonWeb.Begin Web Test
Test Teardown  CommonWeb.End Web Test
Suite Setup  CommonSQL.Connect to DB
Suite Teardown  CommonSQL.Disconnect from DB

#in Phase 0 the browser is left open to view the search results.
#in Phase 1 the search results will appear in a report so the browser can be closed.

#to run type the following line in the terminal
#robot -d results Tests/JobSearch.robot
#robot -d results -i P1 Tests/JobSearch.robot

*** Variables ***

${BROWSER} =  gc
#${URL} =  http://www.robotframeworktutorial.com/front-office/
${SEARCH_TERM} =  Test
${SEARCH_LOCATION} =  Bolingbrook, IL
${SEARCH_RADIUS} =  30
&{Posting}  RecruiterID=0  Headline=Null  Location=Null  Type=Null  Pay=Null
${RowNumber} =  1
@{DATE}

*** Test Cases ***

Open CyberCoders
    [Documentation]  This test opens CyberCoders
    [Tags]  P0
    JobSearchApp.Open CyberCoders

Open Randstrad
    [Documentation]  This test opens Rnadstrad
    [tags]  P0
    JobSearchApp.Open Randstrad

Get CyberCoders
    [Documentation]  This test gets postings from CyberCoders
    [tags]  P1
    JobSearchApp.Open CyberCoders
    JobSearchApp.Read CyberCoders

