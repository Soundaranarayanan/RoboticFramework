*** Settings ***
Suite Setup    Log To Console    opening browser    
Suite Teardown    Log To Console    closing browser

Test Setup    Log To Console    Login to Application
Test Teardown    Log To Console    Logout from Application

*** Test Cases ***
TC1 Smoke Test
    Log To Console    This is Smoke Test
TC2 Regression Test
    Log To Console    This is Regression test
TC3 Sanitary Test
    Log To Console    This is Sanitary Test    