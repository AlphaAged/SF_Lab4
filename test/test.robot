*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    file:///C:/Users/User/Documents/GitHub/SF_Lab4/StarterFiles/Registration.html
${BROWSER}    Chrome
*** Test Cases ***
Open And Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[name="firstname"]    15s
    Input Text    css=input[name="firstname"]    Pheeratchai
    Input Text    css=input[name="lastname"]    Suepsing
    Input Text    css=input[name="organization"]    College of computing
    Input Text    css=input[name="email"]    pheeratchai.s@kkumail.com
    Input Text    css=input[name="phone"]    0864575111
    Click Button  id=registerButton
    Wait Until Page Contains    Thank you for registering with us.    15s
    [Teardown]    Close Browser


