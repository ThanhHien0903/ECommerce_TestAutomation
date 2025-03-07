*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Suite Setup     Run Keywords    Start Test      AND     Login with Admin
Test Setup      Navigae To Account Management Page
Suite Teardown   Close All Browsers
*** Variables ***
${VALID_EMAIL}              nguyenvana@gmail.com
${VALID_EMAIL_TEST}         nguyenvanb@gmail.com
${VALID_PASSWORD}           1234567890
${CONFIM_PASSWORD}          1234567890
${VALID_NAME}               Nguyen Van A
${VALID_PHONE}              0934512345
${VALID_ADDRESS}            Cầu Giấy Hà Nội
${EXISTING_EMAIL}           admin@gmail.com
${EXISTING_EMAIL_ERROR}     Email đã được đăng ký
${SHORT_PASSWORD}           123456
${INVALID_PASSWORD}         xinchaocacban
${INVALID_EMAIL}            admin@gmail.com()><
${INVALID_EMAIL_ERROR}      Phải nhập đúng địa chỉ email
${EMPTY_EMAIL_ERROR}        Phải nhập địa chỉ email
${EMPTY_PASSWORD_ERROR}     mật khẩu phải dài 8-32 ký tự
${ERROR_CONFRIMPASSWORD}    Nhắc lại mật khẩu không đúng
${EMPTY_NAME_ERROR}         Họ tên không được trống
${EMPTY_PHONE_ERROR}        Số điện thoại không được trống
${EMPTY_ADDRESS_ERROR}      Địa chỉ không được trống

*** Test Cases ***
TC_ACC_001: Add Account with Valid Data
    Click "Add account"
    Fill account form        ${VALID_EMAIL}    ${VALID_PASSWORD}    ${CONFIM_PASSWORD}        ${VALID_NAME}    ${VALID_PHONE}                  ${VALID_ADDRESS}
    Click "Confirm"
    Verify displayed successfully
TC_ACC_002: Add Account with Empty Fields
    Click "Add account"
    Click "Confirm"
    Verify error message displayed              ${EMPTY_EMAIL_ERROR}
    Verify error message displayed              ${EMPTY_PASSWORD_ERROR}
    Verify error message displayed              ${EMPTY_NAME_ERROR}
    Verify error message displayed              ${EMPTY_PHONE_ERROR}
    Verify error message displayed              ${EMPTY_ADDRESS_ERROR}
    Click "Don't Save"
TC_ACC_003: Add Account with Short Password
    Click "Add account"
    Fill account form               ${VALID_EMAIL_TEST}    ${SHORT_PASSWORD}    ${SHORT_PASSWORD}    ${VALID_NAME}    ${VALID_PHONE}     ${VALID_ADDRESS}
    Click "Confirm"
    Verify error message displayed              ${EMPTY_PASSWORD_ERROR}
    Click "Don't Save"
TC_ACC_004: Add Account with Mismatched Passwords
    Click "Add account"
    Fill account form               ${VALID_EMAIL_TEST}    ${VALID_PASSWORD}    ${INVALID_PASSWORD}    ${VALID_NAME}    ${VALID_PHONE}     ${VALID_ADDRESS}
    Click "Confirm"
    Verify error message displayed              ${ERROR_CONFRIMPASSWORD}
    Click "Don't Save"
TC_ACC_005: Add Account with Invalid Email
    Click "Add Account"
    Fill Account Form               ${INVALID_EMAIL}    ${VALID_PASSWORD}    ${VALID_PASSWORD}    ${VALID_NAME}    ${VALID_PHONE}    ${VALID_ADDRESS}
    Click "Confirm"
    Verify error message displayed              ${INVALID_EMAIL_ERROR}
    Click "Don't Save"
TC_ACC_006: Add Existing Email Account
    Click "Add account"
    Fill account form               ${EXISTING_EMAIL}    ${VALID_PASSWORD}    ${CONFIM_PASSWORD}    ${VALID_NAME}    ${VALID_PHONE}    ${VALID_ADDRESS}
    Click "Confirm"
    Verify error message displayed              ${EXISTING_EMAIL_ERROR}
    Click "Don't Save"
TC_ACC_007: Delete Account
    Select account to delete
    Confirm deletion       
TC_ACC_008: Access Account Page without Login    
    [Documentation]    Kiểm tra thông báo lỗi khi truy cập trang quản lý tài khoản mà chưa đăng nhập
    Close All Browsers
    Open Browser    http://localhost:8080/laptopshop/admin/lien-he  ${BROWSER}
    Wait Until Page Contains    Truy cập bị từ chối 
    Log To Console    "Error message displayed: Truy cập bị từ chối"
    Close Browser

*** Keywords ***

Click "Add account"
    click element                               ${Web_Account_Add_Button}
    wait until element is visible               ${Web_Account_Add_Popup}
Fill account form
    [Arguments]     ${email}    ${password}    ${confirm_password}    ${name}    ${phone}    ${address}
    input text                                  ${Web_Account_Email_Input}                      ${email}
    input text                                  ${Web_Account_Password_Input}                   ${password}
    input text                                  ${Web_Account_ConfrimPassword_Input}            ${confirm_password}
    click button                                ${Web_Account_Role_Radio}
    input text                                  ${Web_Account_Name_Input}                       ${name}
    input text                                  ${Web_Account_Phone_Input}                      ${phone}
    input text                                  ${Web_Account_Address_Input}                    ${phone}
Click "Confirm"
    click element                               ${Web_Category_Save_Button}
    sleep    3s
Verify displayed successfully
    ${alert_text}    Handle Alert    ACCEPT
    sleep    2s
    Wait Until Element Is Visible               ${Web_Account_AccountTable}
    sleep    2s
    click element                               ${Web_Account_Fill_Dropdown}
    click element                               ${Web_Account_Value_Dropdown}
    Sleep    3s
    Log To Console    Alert message: "${alert_text}"
Verify error message displayed
    [Arguments]                                 ${expected_message}
    Wait Until Page Contains                    ${expected_message}
    Log To Console    "Error message displayed: ${expected_message}"
Click "Don't Save"
    sleep    2s
    click element                               ${Web_Category_Huy_Button}
Select account to delete
    click element                               ${Web_Account_Fill_Dropdown}
    click element                               ${Web_Account_Value_Dropdown}
    Wait Until Element Is Visible               ${Web_Account_AccountTable}
    Click Element                               ${Web_Account_Delete_Button}
Confirm deletion
    Sleep    2s
    ${alert_text}    Handle Alert    ACCEPT
    Log To Console    Alert message: "${alert_text}"
    Sleep    2s


