*** Settings ***
Library           SeleniumLibrary
Library    OperatingSystem
Resource          ../Resources/resource.robot

*** Variables ***
# ${DOWNLOAD_DIR}    C:\\Users\\balkrishna.yadav\\Downloads
# ${DOWNLOAD_DIR}    ${CURDIR}\\Downloads
${injury_illness_report_menu_link}    //a[normalize-space()='Injury Illness']
${reports_menu_link}     //a[normalize-space()='Reports']


${search_button}     //button/span[contains(text(),'Search')]
${export_to_csv_button}    //span[contains(text(),'Export to CSV')]

*** Keywords ***
Select Report Menu in Sidebar
    Wait Until Element Is Visible     ${injury_illness_report_menu_link}    timeout=10s
    Click Element    ${injury_illness_report_menu_link}
    Wait Until Element Is Visible    ${reports_menu_link}    timeout=10s
    Click Element    ${reports_menu_link}


Click On Search Button

    Click Element    ${search_button}

Click On Export To CSV Button
    Sleep    10s
    Click Element    ${export_to_csv_button}



Get File Count In Download Folder
    ${files}=    List Files In Directory    ${DOWNLOAD_DIR}
    ${count}=    Get Length    ${files}
    RETURN   ${count}

Wait For Download To Start
    [Arguments]     ${initial_file_count}    ${timeout}=30s
    Wait Until Keyword Succeeds    ${timeout}    1s    File Should Exist In Download Folder     ${initial_file_count}

File Should Exist In Download Folder
    [Arguments]    ${existing_files_count}
    ${files}=    List Files In Directory    ${DOWNLOAD_DIR}
    ${count}=    Get Length    ${files}
    Log To Console    after downloading file count: ${count}
    Should Be True    ${count} > ${existing_files_count}   msg=No files found in download directory yet.

Wait For Download To Complete
    [Arguments]    ${timeout}=80s
    Wait Until Keyword Succeeds    ${timeout}    2s    Download Completed

Download Completed
    ${files}=    List Files In Directory    ${DOWNLOAD_DIR}
    ${incomplete}=    Evaluate    [f for f in ${files} if f.endswith('.crdownload') or f.endswith('.part')]
    Length Should Be    ${incomplete}    0
    


