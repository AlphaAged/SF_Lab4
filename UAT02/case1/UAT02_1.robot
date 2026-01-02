*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${SCREENSHOT_DIR}    Screenshot

${URL}    http://localhost:7272/StarterFiles/Registration.html
${BROWSER}    Chrome
*** Test Cases ***
Open And Login
    Create Directory    ${SCREENSHOT_DIR}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Capture Page Screenshot    ${SCREENSHOT_DIR}/open_registration.png
    
    Wait Until Element Is Visible    css=input[name="firstname"]    15s
    #Input Text    css=input[name="firstname"]    Somyod
    Input Text    css=input[name="lastname"]    Sodsai
    Input Text    css=input[name="organization"]    CS KKU
    Input Text    css=input[name="email"]    somyod@kkumail.com
    Input Text    css=input[name="phone"]    091-001-1234
    Capture Page Screenshot    ${SCREENSHOT_DIR}/fill.png

    Click Button  id=registerButton
    Wait Until Page Contains    *Please enter your first name!!    15s

    Capture Page Screenshot    ${SCREENSHOT_DIR}/result.png
    [Teardown]    Close Browser


