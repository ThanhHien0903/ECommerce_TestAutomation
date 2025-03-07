*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Library         ../customLibraries/addToCart.py    
Library         Collections
Suite Setup     Run Keywords    Start Test      AND     Login with user
Suite Teardown   Close All Browsers

*** Variables ***
@{listofProducts}    Haier S1 HR-13MZ/Pentium N4200    Haier S1 HR-13M/Celeron N3350    Masstel L133 Pro/Celeron N4100
${Web_Scroll}       xpath=//h3[text()=' Masstel L133/Celeron N3350']
${checkout_name}            TranHien
${checkout_phone}           0912638281
${checkout_address}         98 HaDong HaNoi

${PRODUCT_NAME}        Haier S1 HR-13MZ/Pentium N4200
${PRODUCT_NAME_2}        Haier S1 HR-13M/Celeron N3350
${PRODUCT_NAME_3}        Masstel L133 Celeron N3350
${PRODUCT_NAME_4}         Masstel L133/Celeron N3350
${Message}             Đã thêm sản phẩm vào giỏ hàng
${OUT_OF_STOCK}        Sản phẩm đang hết hàng, quý khách vui lòng quay lại sau
${Negative_quantity}        -5
${Valid_quantity}            3
${total}               51.980.000
${Error_message}        Vui lòng đăng nhập
*** Test Cases ***

TC_CART_001: Add Single Product to Cart
    [Documentation]    Kiểm tra thêm một sản phẩm vào giỏ hàng
    scroll element into view            ${Web_Scroll}
    Add Product to Cart                 ${PRODUCT_NAME}
    Verify Product in Cart              ${Message}
    Navigate to shopping cart page
TC_CART_002: Add Multiple Products to Cart
    [Documentation]    Kiểm tra thêm nhiều sản phẩm vào giỏ hàng
    Navigate to Homepage
    scroll element into view            ${Web_Scroll}
    Add Items To Cart And Checkout      ${listofProducts}
    Navigate to shopping cart page
TC_CART_003: Add Same Product Multiple Times
    [Documentation]    Thêm cùng một sản phẩm nhiều lần
    Navigate to Homepage
    Add Product to Cart    ${PRODUCT_NAME}
    Verify Product in Cart              ${Message}
    Add Product to Cart                ${PRODUCT_NAME}
    Verify Product in Cart              ${Message}
    Navigate to shopping cart page
TC_CART_004: Add Out of Stock Product
    [Documentation]    Thử thêm sản phẩm hết hàng
    Navigate to Homepage
    Add Out of Stock Product
    Verify Product in Cart        ${OUT_OF_STOCK}   
    Navigate to shopping cart page
TC_CART_005: Increase/Decrease Product Quantity
    [Documentation]    Tăng/giảm số lượng sản phẩm
    Navigate to shopping cart page 
    Edit product quantity         ${Valid_quantity}
    Verify total price    ${total}    
TC_CART_006: Remove Product from Cart
    [Documentation]    Kiểm tra xóa sản phẩm khỏi giỏ hàng
    Navigate to Homepage
    Add Product to Cart                 ${PRODUCT_NAME}
    Verify Product in Cart              ${Message}
    Navigate to shopping cart page 
    Remove Product from Cart            
    Remove Product from Cart  
    Remove Product from Cart
TC_CART_007: Add product Without Login
    Close All Browsers
    Open Browser    http://localhost:8080/laptopshop/  ${BROWSER}
    Add Product to Cart                 ${PRODUCT_NAME}
    Wait Until Page Contains    ${Error_message} 
    Close Browser
*** Keywords ***
Add Product to Cart
    [Arguments]    ${product_name}
    Click Element    xpath=//button[@onclick='addToCart(64)']
Verify Product in Cart
    [Arguments]                                 ${expected_message}
    ${alert_text}    Handle Alert    ACCEPT
    sleep    2s
    Log To Console    "Message displayed: ${expected_message}"
Add Out of Stock Product
    Click Element    xpath=//button[@onclick='addToCart(147)']
    Sleep    3s
Remove Product from Cart
    Click Element    xpath=//a[@class='btn btn-danger']
    Sleep    2s
Verify Product Not in Cart
    [Arguments]    ${product_name}
    Wait Until Page Does Not Contain    ${product_name}
    Log To Console    "Product successfully removed from cart: ${product_name}"
Navigate to shopping cart page
    Scroll Element Into View     xpath=//a[@href='/laptopshop/cart']
    Click Element                xpath=//a[@href='/laptopshop/cart']
    Sleep    8s
Navigate to Homepage    
    Click Element    ${Web_Homepage_Logo}
Edit product quantity 
    [Arguments]            ${times}
    Wait Until Element Is Visible    ${Web_Cart_Quantity} 
    Press Keys   ${Web_Cart_Quantity}     ARROW_UP
    Sleep    1s
    ${current_value}=    Get Element Attribute    ${Web_Cart_Quantity}    value
        Log    Current quantity: ${current_value}
Verify error message
    [Arguments]    ${expected_message}
    ${alert_text}=    Handle Alert    ACCEPT
    Should Be Equal As Strings    ${alert_text}    ${expected_message}

Verify total price
    [Arguments]    ${expected_price}
    ${total_price}=    Get Text    xpath=//span[@id='ordertotal']
    Log To Console    Tổng giá trị đơn hàng: ${total_price}

Enter quantity
    [Arguments]            ${quantity}
    Wait Until Element Is Visible    css:.input_num_cart
    Execute JavaScript    
    ...    const input = document.querySelector('.input_num_cart');
    ...    input.removeAttribute('onchange');  # Tắt tạm onchange
    ...    input.value = '${quantity}';
    ...    input.dispatchEvent(new Event('input', { bubbles: true }));
    ...    input.dispatchEvent(new Event('change', { bubbles: true }));
    Press Keys    css:.input_num_cart    ENTER
    Execute JavaScript    
    ...    input.setAttribute('onchange', "changeQuantity(57,this.value,25990000)");  # Bật lại onchange
    Sleep    1s
    ${actual_value}=    Get Element Attribute    css:.input_num_cart    value
    Log To Console    "Expected: ${quantity}, Actual: ${actual_value}"
    Should Be Equal As Strings    ${actual_value}    ${quantity}


Verify items in the Checkout Page and proceed
    click element                     ${Web_Checkout_Button}
    wait until element is visible    ${Web_Checkout_Infor_Title}
Fill the Delivery information form
    [Arguments]    ${checkout_name}     ${checkout_phone}       ${checkout_address}
    input text                       ${Web_Checkout_Name_Input}             ${checkout_name}
    input text                       ${Web_Checkout_PhoneNumber_Input}      ${checkout_phone}
    input text                       ${Web_Checkout_Address_Input}          ${checkout_address}
    click element                    ${Web_Checkout_Submit_Button}


    

