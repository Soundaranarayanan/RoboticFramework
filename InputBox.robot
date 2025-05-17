*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}    https://www.google.co.in/
${browser}    chrome
*** Test Cases ***
InputBox Validation
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${SearchBox}    Set Variable    name:q
    Element Should Be Visible    ${SearchBox}
    Element Should Be Enabled    ${SearchBox}
    Input Text    ${SearchBox}    selenium
    Clear Element Text    ${SearchBox}
    