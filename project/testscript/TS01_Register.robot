*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Test Setup        Start Test        
Test Teardown     Close All Browsers

*** Variables ***
${VALID_EMAIL}            kientruchanoi@gmail.com
${VALID_PASSWORD}         kientruchanoi
${NAME}                   Nguyen Van A
${PHONE}                  0924272842
${ADDRESS}                Hải Phòng
${MISMATCH_PASSWORD}      kientruchau
${EXISTING_EMAIL}         admin@gmail.com
${INVALID_EMAIL}          admin@gmail.com<>
${INVALID_PASSWORD}       hau 
${ERROR_EMPTY_FIELDS}     Please fill out this field.
${ERROR_EXISTING_EMAIL}    Địa chỉ email đã được sử dụng
${ERROR_MESSAGE}    A part following '@' should not contain the symbol '<'.  
${ERROR_PASSWORD_MISMATCH}       Mật khẩu phải dài 8-32 ký tự
${ERROR_CONFIRM_PASSWORD}        Nhắc lại mật khẩu không chính xác
*** Test Cases ***

TC_REG_001: Register with Empty Fields
    [Documentation]    Đăng ký khi bỏ trống các trường
    Click SignIn Button And Verify Redirection
    Submit Registration Form
    Verify Error Empty 
TC_REG_002: Register with Existing Email
    [Documentation]    Đăng ký với email đã tồn tại
    Click SignIn Button And Verify Redirection
    Fill Registration Form    ${EXISTING_EMAIL}    ${VALID_PASSWORD}    ${VALID_PASSWORD}     ${NAME}     ${PHONE}     ${ADDRESS}
    Submit Registration Form
    Verify Error Message             ${ERROR_EXISTING_EMAIL}
TC_REG_003: Register with Invalid Email
    [Documentation]    Định dạng email không hợp lệ
    Click SignIn Button And Verify Redirection
    Fill Registration Form    ${INVALID_EMAIL}    ${VALID_PASSWORD}    ${VALID_PASSWORD}     ${NAME}     ${PHONE}     ${ADDRESS}
    Submit Registration Form
    Verify Email Error Message 
TC_REG_004: Register with Password Mismatch
    [Documentation]    Mật khẩu và xác nhận mật khẩu không khớp
    Click SignIn Button And Verify Redirection
    Fill Registration Form    ${VALID_EMAIL}    ${INVALID_PASSWORD}    ${INVALID_PASSWORD}     ${NAME}     ${PHONE}     ${ADDRESS}
    Submit Registration Form
    Verify Error Message              ${ERROR_PASSWORD_MISMATCH}
TC_REG_005: Register with Mismatched Passwords
    [Documentation]    Đăng ký khi mật khẩu không khớp
    Click SignIn Button And Verify Redirection
    Fill Registration Form    ${VALID_EMAIL}    ${VALID_PASSWORD}    ${MISMATCH_PASSWORD}     ${NAME}     ${PHONE}     ${ADDRESS}
    Submit Registration Form
    Verify Error Message             ${ERROR_CONFIRM_PASSWORD}
TC_REG_006: Register with Valid Data
    Click SignIn Button And Verify Redirection
    Fill Registration Form    ${VALID_EMAIL}    ${VALID_PASSWORD}    ${VALID_PASSWORD}     ${NAME}     ${PHONE}     ${ADDRESS}
    Submit Registration Form
    Verify Registration Success
*** Keywords ***
Click SignIn Button And Verify Redirection
    click element                       ${Web_Signin_Button}
    wait until element is visible       ${Web_Sigin_Title}
    Log To Console    "Redirected to registration page successfully.
Fill Registration Form
    [arguments]     ${email}         ${password}     ${confirm_password}     ${name}     ${phone_number}     ${address}
    input text      ${Web_Signin_Email_Input}                ${email}
    input text      ${Web_Signin_Password_Input}             ${password}
    input text      ${Web_Signin_ConfrimPassword_Input}      ${confirm_password}
    input text      ${Web_Signin_Name_Input}                 ${name} 
    input text      ${Web_Signin_PhoneNumber_Input}          ${phone_number}
    input text      ${Web_Signin_Address_Input}              ${address}
    Log To Console    "Filled registration form with email: ${email}"
Submit Registration Form
    click button    ${Web_Signin_Submit_Button}
    Sleep    3s
    Log To Console    "Clicked register button."
Verify Registration Success
    Wait Until Element Is Visible       xpath=//img[@title='logo']
    Sleep    3s 
    Log To Console    "Registration successful!"
Verify Error Message 
    [Arguments]    ${error_message}
    [Documentation]    Kiểm tra thông báo lỗi
    Wait Until Page Contains    ${error_message}
    Sleep    3s
    Log To Console    "Error message displayed: ${error_message}"
Verify Email Error Message 
    ${error_message}=    Execute Javascript    return document.querySelector("input[name='email']").validationMessage;
    Log To Console    "Error message: ${error_message}"
    Should Be Equal As Strings    ${error_message}    A part following '@' should not contain the symbol '<'.
    Sleep    3s 
Verify Error Empty 
    Sleep    3s
    ${error_message}=    Execute Javascript    return document.querySelector("input[name='email']").validationMessage;
    Log To Console    "Error message: ${error_message}"
    Should Be Equal As Strings    ${error_message}    Please fill out this field.

