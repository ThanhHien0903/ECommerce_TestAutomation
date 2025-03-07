*** Settings ***
Resource        ../environment/library.robot

*** Keywords ***
Start Test
    [Documentation]
    ...    [Description]
    ...    [Author]
    ...    [Date]
    Log To Console    Start Test
    Open Browser     ${url}       ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible       ${Web_Homepage_Logo}
Login with Admin
    [Documentation]
    ...    [Description]
    ...    [Author]
    ...    [Date]
    Log To Console    Login with Admin
    click element                       ${web_login_button}
    wait until element is visible       ${Web_Login_Title}
    input text                          ${web_login_input_email}        ${admin_username}
    input text                          ${Web_Login_Input_Password}     ${admin_password}
    click button                        ${Web_Login_Button_Submit}
    wait until element is visible       ${web_admin_laptopshop}
Login with user
    [Documentation]
    ...    [Description]
    ...    [Author]
    ...    [Date]
    Log To Console    Login with user
    click element                       ${web_login_button}
    wait until element is visible       ${Web_Login_Title}
    input text                          ${web_login_input_email}        ${customer_username}
    input text                          ${Web_Login_Input_Password}     ${customer_password}
    click button                        ${Web_Login_Button_Submit}
    wait until element is visible       ${Web_Homepage_Custumer}
Navigate To Add Product Page
    click element                       ${Web_AdminHomepage_Sanpham}
    wait until element is visible       ${Web_AddProduct_Title}
Navigate To Categoty Management Page
    click element                       ${Web_Category_Slect}
    wait until element is visible       ${Web_Category_Title}
Navigate To Brand Management Page
    click element                       ${Web_Brand_Select}
    wait until element is visible       ${Web_Brand_Title}
Navigae To Account Management Page
    click element                       ${Web_Account_Select}
    wait until element is visible       ${Web_Account_Title}






