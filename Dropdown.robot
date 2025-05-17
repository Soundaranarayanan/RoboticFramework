*** Settings ***
Documentation     To validate the selection of dropdown
Library    SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Select options in Dropdown
    Open the Browser with URL
    Select the dropdown options APIs by value
    Select the dropdown options Microsoft Excel by index
    Select the dropdown options CSS by label

*** Keywords ***
Open the Browser with URL
     Go To    https://demo.automationtesting.in/Register.html
     Maximize Browser Window
     Set Selenium Implicit Wait    2
Select the dropdown options APIs by value
     Select From List By Value    id:skills    APIs
Select the dropdown options Microsoft Excel by index
     Select From List By Value    id:skills    43  
Select the dropdown options CSS by label
     Select From List By Label    id:skills    CSS         


    
