*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Test Setup        Start Test
Test Teardown     Close All Browsers

*** Variables ***

*** Test Cases ***
Logout_Admin
    [Documentation]
    ...       [Description]
    ...        [TC_ID]
    ...        [Author]         TranHien
    ...        [Date]           20/2/2025
    log to console    Logout with account admin
    Login with Admin
    Sleep    5s
    Click Logout Button And Verify Redirection
    Wait until Element is located in the page

*** Keywords ***
Click Logout Button And Verify Redirection
    click element    xpath=//a[@href='/laptopshop/logout']
    Sleep    5s
Wait until Element is located in the page
    wait until element is visible    ${Web_Login_Title}
    wait until element is visible    xpath=//p[text()='Bạn đã đăng xuất thành công.']

