*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Test Setup        Start Test
Test Teardown     Close All Browsers

*** Variables ***
${Web_Homepage_Customer}        xpath=//img[@src='Frontend/img/logo3.png']
${empty}
*** Test Cases ***
TC_LG_001: Login as admin with a valid credential
    Click Login Button And Verify Redirection
    Fill the login Form        ${admin_username}   ${admin_password}
    Wait until Element is located in the page        ${Web_Admin_LaptopShop}
TC_LG_002: Login as normal user with a valid credential
    Click Login Button And Verify Redirection
    Fill the login form        ${customer_username}    ${customer_password}
    Wait until Element is located in the page        ${Web_Homepage_Customer}
TC_LG_003: Login after failed attempt
    Click Login Button And Verify Redirection
    Fill the login form    ${invalid_username}    ${invalid_password}
    wait until it checks and display error message
    Fill the login form    ${customer_username}    ${customer_password}
    Wait until Element is located in the page    ${Web_Homepage_Customer}
TC_LG_004: Login with an invalid credential
    Click Login Button And Verify Redirection
    Fill the login form    ${customer_username}    ${invalid_password}
    wait until it checks and display error message
TC_LG_005: Login with a non-existing account
    Click Login Button And Verify Redirection
    Fill the login form    ${invalid_username}    ${invalid_password}
    wait until it checks and display error message
TC_LG_006: Login Without Username    
    Click Login Button And Verify Redirection
    Fill the login form    ${empty}    ${invalid_password}
    Verify Error Empty Username 
TC_LG_007: Login Without Password
    Click Login Button And Verify Redirection
    Fill the login form    ${customer_username}    ${empty}
    Verify Error Empty Password
TC_LG_008: Login Without Username And Password
    Click Login Button And Verify Redirection
    Fill the login form    ${empty}    ${empty}
    Verify Error Empty Username 
TC_LG_009: Special characters
    Click Login Button And Verify Redirection
    Fill the login form    ${Special_username}    ${admin_password}
    wait until it checks and display error message
TC_LG_010: Numeric characters
    Click Login Button And Verify Redirection
    Fill the login form    ${Numeric_username}    ${admin_password}
    wait until it checks and display error message
*** Keywords ***
Click Login Button And Verify Redirection
    click element                       ${Web_Login_Button}
    wait until element is visible       ${Web_Login_Title}
Fill the login form
    [arguments]     ${username}                     ${password}
    input text      ${Web_Login_Input_Email}        ${username}
    input text      ${web_login_input_password}     ${password}
    click button    ${Web_Login_Button_Submit}
Wait until Element is located in the page
    [Arguments]                    ${homepage}
    wait until element is visible    ${homepage}
    Sleep    5s
Fill the invalid username login form
    [arguments]     ${invalid_username}             ${admin_password}
    input text      ${Web_Login_Input_Email}        ${invalid_username}
    input text      ${web_login_input_password}     ${admin_password}
    click button    ${Web_Login_Button_Submit}
wait until it checks and display error message
    wait until element is visible    ${Web_Login_ErrorMessage}
Verify Error Empty Username
    Sleep    3s
    ${error_message}=    Execute Javascript    return document.querySelector("input[name='email']").validationMessage;
    Log To Console    "Error message: ${error_message}"
    Should Be Equal As Strings    ${error_message}    Please fill out this field.
Verify Error Empty Password
    Sleep    3s
    ${error_message}=    Execute Javascript    return document.querySelector("input[name='password']").validationMessage;
    Log To Console    "Error message: ${error_message}"
    Should Be Equal As Strings    ${error_message}    Please fill out this field.
    
