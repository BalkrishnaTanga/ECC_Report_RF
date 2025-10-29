*** Settings ***
Library           SeleniumLibrary


*** Variables ***

${MIS_report_card_link}     //*[contains(text(),'MIS Assessment Report')]

${service_type_dropdown}       //*[@name='ServiceType']//input

${start_date_input}     //*[@name='datePickerStartOpenDate']
${end_date_input}     //*[@name='datePickerEndOpenDate']

${search_button}        //button//span[contains(text(),' Search')]

${first_option}        //*[@role='option'][1]

${case_status_dropdown}     //*[@name='CaseStatus']//input
*** Keywords ***
Navigate To MIS Report Page
    Wait Until Element Is Visible    ${MIS_report_card_link}    timeout=10s
    Click Element    ${MIS_report_card_link}

Select Service Type option
    Wait Until Element Is Visible    ${service_type_dropdown}    timeout=5s
    Input Text    ${service_type_dropdown}    Service Location
    Wait Until Element Is Visible    ${first_option}      timeout=10s
    Click Element    ${first_option}
    Clear Element Text    ${service_type_dropdown}   


 Select Start and end Date
    [Arguments]    ${start_date}    ${end_date}
    Input Text    ${start_date_input}    ${start_date}
    Input Text    ${end_date_input}      ${end_date} 

 Select Case Status
    [Arguments]    ${case_status}
    Wait Until Element Is Visible    ${case_status_dropdown}    timeout=5s
    Input Text    ${case_status_dropdown}    ${case_status}
    Wait Until Element Is Visible    ${first_option}      timeout=5s
    Press Keys    ${case_status_dropdown}    RETURN   

