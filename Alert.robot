# *** Settings ***
# Documentation     To validate the Alert
# Library           SeleniumLibrary
# Test Teardown     Close Browser

# *** Variables ***
# ${okOption}    //button[@class='btn btn-danger']

# *** Test Cases ***
# Handle Alerts
#     Open the browser with URL
#     Select the alert with Ok button
#     verify text on Alert box
#     select the alert with OK and cancel button
#     select the alert with text box


# *** Keywords ***
# Open the browser with URL
#     Create Webdriver    Chrome
#     Go To    https://demo.automationtesting.in/Alerts.html
#     Maximize Browser Window
#     Set Selenium Implicit Wait    15

# Select the alert with Ok button
#     Click Element    ${okOption}

# verify text on Alert box
#     Alert Should Be Present    I am an alert box!    ACCEPT

# select the alert with OK and cancel button
#     Click Element    xpath://a[text()='Alert with OK & Cancel ']
#     Click Button    xpath://button[text()='click the button to display a confirm box ']
#     Handle Alert    action=DISMISS

# select the alert with text box
    # Click Element    xpath://a[text()='Alert with Textbox ']
    # Click Button    xpath://button[text()='click the button to demonstrate the prompt box ']
#     Input Text Into Alert    Hai 
#     # ${message}=    Handle Alert
#     # Log To Console    ${message}
#     # Handle Alert
#     Page Should Contain    Hello Hai How are you today
#     # Handle Alert



# *** Settings ***
# Library    SeleniumLibrary
# *** Test Cases ***
# Handle Alerts
#     Open Browser    https://demo.automationtesting.in/Alerts.html    chrome
#     Click Element    xpath:(//a[@class='analystic'])[2]
#     Click Element    xpath://button[@onclick='confirmbox()']
#     Sleep    2s
#     Handle Alert    dismiss
#     Click Element    xpath://a[text()='Alert with Textbox ']
#     Click Button    xpath://button[text()='click the button to demonstrate the prompt box ']
#     Input Text Into Alert    sou
#     Handle Alert    accept

# *** Keywords ***

 



*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Handle Prompt Alert By Sending Name
    Open Browser    https://demo.automationtesting.in/Alerts.html    chrome
    Maximize Browser Window

    Click Element    xpath:(//a[@class='analystic'])[3]
    Click Element    xpath://button[@onclick='promptbox()']
    
    Input Text Into Alert    John
    Handle Alert    accept

    Page Should Contain    Hello John How are you today
    Close Browser
