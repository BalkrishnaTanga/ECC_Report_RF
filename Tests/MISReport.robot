*** Settings ***
Library     SeleniumLibrary
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/MISReport.robot
Resource    ../Pages/BasePage.robot


Test Setup    Login To Application
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
MIS Report Open Status
    [Tags]    smoke
    ${initial_file_count}=    Get File Count In Download Folder
    Select Report Menu in Sidebar
    Navigate To MIS Report Page
    Select Case Status    Open
    Select Service Type option
    Select Start and end Date    09/01/2025    10/29/2025
    Click On Search Button
    Click On Export To CSV Button
    Wait For Download To Start     ${initial_file_count}
    Wait For Download To Complete
    Log To Console    File download completed successfully
#smoke test case
 MIS Report ReOpen Status
    [Tags]    smoke
    ${initial_file_count}=    Get File Count In Download Folder
    Select Report Menu in Sidebar
    Navigate To MIS Report Page
    Select Case Status    Reopened
    Select Service Type option
    Select Start and end Date    09/01/2025    10/29/2025
    Click On Search Button
    Click On Export To CSV Button
    Wait For Download To Start     ${initial_file_count}
    Wait For Download To Complete
    Log To Console    File download completed successfully   