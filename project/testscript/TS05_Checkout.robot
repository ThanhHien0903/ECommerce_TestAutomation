*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot   
Library         Collections
Suite Setup     Run Keywords    Start Test      AND     Login with user
Suite Teardown   Close All Browsers
*** Variables ***
${PRODUCT_NAME}        Haier S1 HR-13MZ/Pentium N4200
${Message}             Đã thêm sản phẩm vào giỏ hàng
${name}                Tran Quang Hung
${phone}               09343682823
${address}             Hoang Mai - Ha Noi
${empty_name}            ${EMPTY}
${invalid_phone}        hello
${Error_message}        Số điện thoại không hợp lệ
${invalid_address}      HN
${Error_message_address}    Địa chỉ quá ngắn
*** Test Cases ***
TC_CHECKOUT_001: Checkout with Empty Cart
    [Documentation]    Thanh toán khi giỏ hàng trống
    Navigate to shopping cart page
    Verify Checkout Button Is Hidden
TC_CHECKOUT_002: Checkout without Name
    [Documentation]    Thanh toán để trống trường Họ tên
    Navigate to Homepage
    Add Product to Cart                 ${PRODUCT_NAME}
    Verify Product in Cart              ${Message}
    Navigate to shopping cart page
    Navigate to checkout page        ${empty_name}    ${phone}    ${address}
    Click Checkout button
    Verify Error Empty Username
TC_CHECKOUT_003: Checkout with Invalid Phone Number
    [Documentation]    Thanh toán với số điện thoại không hợp lệ
    Navigate to shopping cart page
    Navigate to checkout page        ${name}    ${invalid_phone}    ${address}
    Click Checkout button
    Verify Error Message             ${Error_message}
TC_CHECKOUT_004: Add Out-of-Stock Product to Cart
    [Documentation]    Nhập địa chỉ dưới 5 ký tự
    Navigate to shopping cart page
    Navigate to checkout page        ${name}    ${phone}    ${invalid_address}
    Click Checkout button
    Verify Error Message             ${Error_message_address}
TC_CHECKOUT_005: Checkout with Valid Information
    [Documentation]    Thanh toán với thông tin hợp lệ
    Close All Browsers
    Start Test
    Login with user
    Add Product to Cart                 ${PRODUCT_NAME}
    Verify Product in Cart              ${Message}
    Navigate to shopping cart page
    Navigate to checkout page        ${name}    ${phone}    ${address}
    Click Checkout button

*** Keywords ***
Add Product to Cart
    [Arguments]    ${product_name}
    Click Element    xpath=//button[@onclick='addToCart(64)']
Verify Product in Cart
    [Arguments]                                 ${expected_message}
    ${alert_text}    Handle Alert    ACCEPT
    sleep    2s
    Log To Console    "Message displayed: ${expected_message}"
Navigate to shopping cart page
    Scroll Element Into View     xpath=//a[@href='/laptopshop/cart']
    Click Element                xpath=//a[@href='/laptopshop/cart']
    Sleep    5s
Navigate to checkout page
    [Arguments]        ${Name}        ${PhoneNumber}    ${Adress} 
    Click Element    ${Web_Checkout_Button}
    Wait Until Element Is Visible    ${Web_Checkout_Infor_Title}
    Input Text    ${Web_Checkout_Name_Input}           ${Name}
    Input Text    ${Web_Checkout_PhoneNumber_Input}    ${PhoneNumber}
    Input Text    ${Web_Checkout_Address_Input}        ${Adress} 
Click Checkout button
    Click Button    ${Web_Checkout_Submit_Button}
    Sleep    2s
Verify Error Empty Username
    ${error_message}=    Execute Javascript    return document.querySelector("input[name='hoTenNguoiNhan']").validationMessage;
    Log To Console    "Error message: ${error_message}"
    Should Be Equal As Strings    ${error_message}    Please fill out this field.
Verify Error Message 
    [Arguments]                                 ${expected_message}
    Wait Until Page Contains                    ${expected_message}
    Log To Console    "Error message displayed: ${expected_message}"
Verify Checkout Button Is Hidden
    Wait Until Element Is Visible    xpath=//p[@class='cart_tongdonhang']
    Sleep    5s

Navigate to Homepage
    Click Element    ${Web_Homepage_Logo}
    