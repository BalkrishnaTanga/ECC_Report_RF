*** Settings ***
Library           SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${DOWNLOAD_DIR}    C:\\Users\\balkrishna.yadav\\Downloads
# ${injury_illness_report_menu_link}    //a[normalize-space()='Injury Illness']
# ${reports_menu_link}     //a[normalize-space()='Reports']
${injury_illness_report_card_link}    //h4[text()='Injury Illness Report']

${current_company_input}    //*[@name='Corporation']//input

${start_date_input}      //*[@name='datePickerStartOpenDate']
${end_date_input}      //*[@name='datePickerEndOpenDate'] 

${first_option}        //*[@role='option'][1]
${first_checkbox}     (//*[@type='checkbox'])[1]

${encounter_status_dropdown}    //*[@name='EncounterStatus']//input
${service_type_dropdown}    (//*[@name='ServiceType']//input)[1]
${service_location_dropdown}    //*[@name='ServiceLocation']//input
${case_status_dropdown}     //*[@name='CaseStatus']//input
${search_button}     //button/span[contains(text(),'Search')]
${export_to_csv_button}    //span[contains(text(),'Export to CSV')]



*** Keywords ***
Navigate To Injury Illness Report Page
    Wait Until Element Is Visible    ${injury_illness_report_card_link}    timeout=10s
    Click Element    ${injury_illness_report_card_link}

Select Current Company
    Wait Until Element Is Visible     //*[@name='Corporation']//input    timeout=5s
    # Click Element    //div[contains(@class,'ng-dropdown-panel')]//span[text()='48Forty']
    Input Text   //*[@name='Corporation']//input    Automation comp
    Wait Until Element Is Visible    //*[@role='option'][1]      timeout=10S
    Press Keys    //*[@name='Corporation']//input    RETURN


Select Start and end Date
    [Arguments]    ${start_date}    ${end_date}
    Input Text    ${start_date_input}    ${start_date}
    Input Text    ${end_date_input}      ${end_date}

Select Encounter Status
    [Arguments]    ${encounter_status}
    Input Text    ${encounter_status_dropdown}     ${encounter_status}
    Wait Until Element Is Visible    ${first_option}      timeout=5s
    Press Keys    ${encounter_status_dropdown}    RETURN

Select Service Type
    Input Text    ${service_type_dropdown}   Service Location
    Wait Until Element Is Visible    ${first_option}      timeout=5s
    Click Element    ${first_option}
    Clear Element Text    ${service_type_dropdown}

Select Service Location
    Wait Until Element Is Visible    ${service_location_dropdown}    timeout=25s
    Click Element    ${service_location_dropdown}
    Click Element    ${first_checkbox}

Select Case Status
    Input Text    ${case_status_dropdown}    All
    Wait Until Element Is Visible    ${first_option}      timeout=5s
    Press Keys    ${case_status_dropdown}    RETURN

