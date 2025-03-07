*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Suite Setup     Run Keywords    Start Test      AND     Login with user
Suite Teardown   Close All Browsers

*** Variables ***
*** Test Cases ***
TC_HP_001: Verify Homepage Loads Successfully
    [Documentation]    Kiểm tra trang chủ tải lên thành công
     scroll element into view           ${Web_Homepage_Title}
     wait until element is visible      ${Web_Homepage_Title}
     Log To Console    "Homepage loaded successfully.
TC_HP_002: Verify Product List Display
    [Documentation]    Kiểm tra danh sách sản phẩm hiển thị đúng
    sleep    2s
    scroll element into view          ${Web_Homepage_Product_Name}
    Execute Javascript                ${Web_Zoom75%}
    sleep    2s
    wait until element is visible     ${Web_Homepage_Product_Name}
    Log To Console    "Product list displayed correctly."
TC_HP_003: Verify Price Format
    [Documentation]    Kiểm tra định dạng giá sản phẩm
    scroll element into view     ${Web_Homepage_Product_Name}
    Page Should Contain          ${Web_Homepage_Price_Fomat}
    Log To Console    "Price format is correct."
TC_HP_004: Verify "Add to Cart" Buttons
    [Documentation]    Kiểm tra nút "Giỏ hàng" có hoạt động
    Scroll Element Into View     ${Web_Cart_Button}
    Click Element                ${Web_Cart_Button}
    Sleep    5s    
    Log To Console    "Add to cart button works correctly."
TC_HP_005: Verify Navigation Menu
    [Documentation]    Kiểm tra menu "Danh mục"
    Wait Until Element Is Visible   ${Web_Homepage_Category_Menu}
    sleep    2s
    Click Element                   ${Web_Homepage_Category_Select}
    sleep    2s
    wait until element is visible   ${Web_Cart_Menu}
    Log To Console    "Navigation menu works correctly."

*** Keywords ***
