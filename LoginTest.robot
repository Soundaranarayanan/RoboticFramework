*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login 
${browser}    chrome

*** Test Cases ***
LoginTest
    Open Browser    ${url}    &{browser}   
    Maximize Browser Window
    Login To OrangeHRM
    Close Browser

*** Keywords ***
Login To OrangeHRM
    Wait Until Element Is Visible    xpath://input[@name='username']    10s
    Input Text    xpath://input[@placeholder='Username']    Admin
    Input Password    xpath://input[@placeholder='Password']    admin123
    Click Button    xpath://button[@type='submit']
