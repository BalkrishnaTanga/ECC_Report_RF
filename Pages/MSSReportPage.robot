*** Settings ***        
Library           SeleniumLibrary


*** Variables ***
${mss_report_card_link}     //*[contains(text(),'MSS Report')]

${first_option}        //*[@role='option'][1]
${first_checkbox}     (//*[@type='checkbox'])[1]

${service_option_dropdown}    //*[@name="locationOption"]//input
${service_location_dropdown}    (//*[@name="serviceLocation"]//input)[1]
${start_date_input}     //*[@name="datePickerMssReportStartDate"]
${end_date_input}     //*[@name="datePickerMssReportEndDate"]
${case_status_dropdown}     //*[@name="caseStatus"]//input

*** Keywords ***    
Navigate To MSS Report Page
    Wait Until Element Is Visible    ${mss_report_card_link}    timeout=10s
    Click Element    ${mss_report_card_link}

Select Service Option
    Wait Until Element Is Visible    ${service_option_dropdown}    timeout=5s
    Input Text    ${service_option_dropdown}    Service Location
    Wait Until Element Is Visible    ${first_option}      timeout=10s
    Click Element    ${first_option}
  
    Clear Element Text    ${service_option_dropdown}    

Select Service Location
    Wait Until Element Is Visible    ${service_location_dropdown}    timeout=20s
    Sleep    5s
    Click Element    ${service_location_dropdown}
    Sleep    15s
    Wait Until Element Is Visible    ${first_option}      timeout=10s
    Click Element    ${first_checkbox}

Select Start and end Date
    [Arguments]    ${start_date}    ${end_date}
    Input Text    ${start_date_input}    ${start_date}
    Input Text    ${end_date_input}      ${end_date}

Select Case Status
    [Arguments]    ${case_status}
    Input Text    ${case_status_dropdown}    ${case_status}
    Wait Until Element Is Visible    ${first_option}      timeout=5s
    Press Keys    ${case_status_dropdown}    RETURN