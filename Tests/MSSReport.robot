*** Settings ***
Library     SeleniumLibrary
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/BasePage.robot
Resource    ../Pages/MSSReportPage.robot

Test Setup    Login To Application
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
MSS Report Open Status Export to CSV
    ${initial_file_count}=    Get File Count In Download Folder
    Select Report Menu in Sidebar
    Navigate To MSS Report Page
    Select Service Option
    Select Service Location
    Select Start and end Date    09/01/2025    10/29/2025
    Select Case Status    Open
    Click On Search Button
    Click On Export To CSV Button
    Wait For Download To Start     ${initial_file_count}
    Wait For Download To Complete
    Log To Console    File download completed successfully  


MSS Report Reopen Status Export to CSV
    ${initial_file_count}=    Get File Count In Download Folder
    Select Report Menu in Sidebar
    Navigate To MSS Report Page
    Select Service Option
    Select Service Location
    Select Start and end Date    09/01/2025    10/29/2025
    Select Case Status    Reopen
    Click On Search Button
    Click On Export To CSV Button
    Wait For Download To Start     ${initial_file_count}
    Wait For Download To Complete
    Log To Console    File download completed successfully  