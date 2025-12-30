*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    Chrome

*** Test Cases ***
Open And Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[name="username"]    15s
    Input Text    css=input[name="username"]    Admin
    Input Text    css=input[name="password"]    admin123
    Click Button  css=button[type="submit"]
    Wait Until Page Contains    Dashboard    15s
    [Teardown]    Close Browser
