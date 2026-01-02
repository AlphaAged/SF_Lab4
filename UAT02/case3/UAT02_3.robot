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
    
Empty First Name and Last Name
    Wait Until Element Is Visible    css=input[name="firstname"]    15s
    #Input Text    css=input[name="firstname"]    Somyod
    #Input Text    css=input[name="lastname"]    Sodsai
    Input Text    css=input[name="organization"]    CS KKU
    Input Text    css=input[name="email"]    somyod@kkumail.com
    Input Text    css=input[name="phone"]    091-001-1234

    Click Button  id=registerButton
    Wait Until Page Contains    Please enter your name!!    15s

    Capture Page Screenshot    ${SCREENSHOT_DIR}/result_without_name.png
    [Teardown]    Close Browser

Empty Email
    Create Directory    ${SCREENSHOT_DIR}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[name="firstname"]    15s
    Input Text    css=input[name="firstname"]    Somyod
    Input Text    css=input[name="lastname"]    Sodsai
    Input Text    css=input[name="organization"]    CS KKU
    #Input Text    css=input[name="email"]    somyod@kkumail.com
    Input Text    css=input[name="phone"]    091-001-1234

    Click Button  id=registerButton
    Wait Until Page Contains    Please enter your email!!    15s

    Capture Page Screenshot    ${SCREENSHOT_DIR}/result_without_email.png
    [Teardown]    Close Browser

