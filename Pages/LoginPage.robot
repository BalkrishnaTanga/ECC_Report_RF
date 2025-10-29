*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/resource.robot

*** Variables ***
${DOWNLOAD_DIR}    C:\\Users\\balkrishna.yadav\\Downloads
${username_input}    //input[@name="LoginId"]
${password_input}    //input[@name="Password"]
${login_button}    //input[@value='Log in']

*** Keywords ***
Fill Login Form
    [Arguments]    ${username}    ${password}
    Input Text    ${username_input}    ${username}
    Input Text    ${password_input}    ${password}
    Click Button    ${login_button}

Login To Application
    ${prefs}=    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}    download.prompt_for_download=False
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    # Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-cache
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --safebrowsing-disable-download-protection
    Call Method    ${options}    add_argument    --no-sandbox
    Open Browser    https://test-ecc.tangandcompany.com/Account/Login    chrome    options=${options}
    Fill Login Form    ${username}    ${password}

