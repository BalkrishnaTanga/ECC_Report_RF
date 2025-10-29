*** Settings ***
Library           SeleniumLibrary
Resource         ../Pages/LoginPage.robot
Resource         ../Pages/InjuryIllnessReportPage.robot
Resource    ../Pages/BasePage.robot

Test Setup    Login To Application
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Injury Illness Report Open Status Export To CSV
    ${initial_file_count}=    Get File Count In Download Folder
    Select Report Menu in Sidebar
    Navigate To Injury Illness Report Page
    Select Start and end Date    09/01/2025    10/29/2025
    Select Encounter Status    Open
    Select Service Type
    Select Service Location
    Select Case Status
    Click On Search Button
    Click On Export To CSV Button
    Wait For Download To Start     ${initial_file_count}
    Wait For Download To Complete
    Log To Console    File download completed successfully

Injury Illness Report Closed Status Export To CSV
    ${initial_file_count}=    Get File Count In Download Folder
    Select Report Menu in Sidebar
    Navigate To Injury Illness Report Page
    Select Start and end Date    09/01/2025    10/29/2025
    Select Encounter Status    Closed
    Select Service Type
    Select Service Location
    Select Case Status
    Click On Search Button
    Click On Export To CSV Button
    Wait For Download To Start     ${initial_file_count}
    Wait For Download To Complete
    Log To Console    File download completed successfully    