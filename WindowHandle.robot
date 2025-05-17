# *** Settings ***
# Documentation     To validate the MultipleWindows
# Library           SeleniumLibrary
# Test Teardown     Close Browser

# *** Variables ***
# ${mainPageText}    //h1[text()='Automation Demo Site ']

# *** Test Cases ***
# Select Options in Dropdown
#     Open the browser with URL
#     Select the button to switch to child window
#     verify the child window is opened
#     verify the user is switched back to parent window
#     verify the user is switched back to child window

# *** Keywords ***
# Open the browser with URL
#     Create Webdriver    Chrome
#     Go To    https://demo.automationtesting.in/Windows.html
#     Maximize Browser Window
#     Set Selenium Implicit Wait    5

# Select the button to switch to child window
#     ${ParentWindow} = Get Window Handles
#     Click Element    xpath://div[@class='tabpane pullleft']/ul/li[2]/a
#     Click Button    css:.btn-primary
#     ${Windows} = Get Window Handles
#     ${count} = Get Length    ${Windows}
#     Log    ${count}
#     Sleep 5s

# verify the child window is opened
#     Switch Window    NEW

# verify the user is switched back to parent window
#     Switch Window    MAIN
#     Element Text Should Be    ${mainPageText}    Automation Demo Site

# verify the user is switched back to child window
#     Switch Window    title=Selenium
#     Sleep    5

*** Settings ***
Documentation     To access the dropdown and handle child window
Library           SeleniumLibrary
Task Teardown     Close Browser Session
*** Variables ***
${url}            https://demo.automationtesting.in/Windows.html
*** Test Cases ***
Handle Child Window
    Open The Browser With URL
    Select The Button To Switch To Child Window
    Verify The Child Window Is Opened
    Switch Back To Parent Window
    Switch Back To Child Window
*** Keywords ***
Open The Browser With URL
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Select The Button To Switch To Child Window
    ${all_before}=    Get Window Handles
    ${main_window}=   Set Variable    ${all_before[0]}
    Click Element     xpath://*[@id="Tabbed"]/a/button
    Sleep             2s
    ${all_after}=     Get Window Handles
    FOR    ${handle}    IN    @{all_after}
        Run Keyword If    '${handle}' != '${main_window}'    Set Suite Variable    ${child_window}    ${handle}
    END
    Set Suite Variable    ${main_window}

Verify The Child Window Is Opened
    Switch Window    ${child_window}
    ${title}=        Get Title
    Log To Console   Child Window Title: ${title}

Switch Back To Parent Window
    Switch Window    ${main_window}
    ${title}=        Get Title
    Log To Console   Switched Back to Parent: ${title}

Switch Back To Child Window
    Switch Window    ${child_window}
    ${title}=        Get Title
    Log To Console   Switched Back to Child: ${title}

Close Browser Session
    Close Browser