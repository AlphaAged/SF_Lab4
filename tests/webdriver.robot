*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    C:\\file for study\\soft en\\ChromeForTesting\\chrome-win64\\chrome-win64\\chrome.exe
${CHROME_DRIVER_PATH}     C:\\file for study\\soft en\\ChromeForTesting\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe
${URL}                    https://www.kku.ac.th

*** Test Cases ***
TC_001 Start Chrome For Testing
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${service}    Evaluate
    ...    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys

    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}
    Sleep    3s
    [Teardown]    Close Browser
