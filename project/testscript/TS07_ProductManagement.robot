*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Suite Setup     Run Keywords    Start Test      AND     Login with Admin
Test Setup      Navigate To Add Product Page
Suite Teardown   Close All Browsers
*** Variables ***
${HangSanXuat}                      xpath=(//option[@value='2'])[4]
${TypeOfProduct}                    1
# Đường dẫn ảnh tuyệt đối
${IMAGE_PATH}   C:\\development\\RobotFramework\\Testing\\project\\Images\\macbook-air-m2.jpg
${AddProduct_Input}     xpath=//input[@id='searchById']
${valid_code}        11
${invalid_code}        dell
${search_result}        xpath=//td[text()='Asus E402NA-GA034T']
${Search_invalid_result}
${error_message}
*** Test Cases ***
TC01_Upload Product with Valid Data
    Click "Upload" button
    Upload Product Details
    Upload Product Image                ${IMAGE_PATH}
    Click "Submit" button
    Verify Product Upload Success
    Verify product inlists
TC02_Upload Product without Images
    Click "Upload" button
    Upload Product Details
    Click "Submit" button
    Verify error message 
TC03_Upload Product with Missing Fields
    Click "Upload" button
    Upload Product with missing fields
    Click "Submit" button
    Verify error message displayed
TC04_Update Product Name
    Click "Update" button
    Click "Submit" button
    Verify Product Upload Success
TC05_Update Without Any Change
    Click "Update" button without any change
    Click "Submit" button
TC06_Delete Product
    Click "Delete" button
    Verify Product Upload Success    #Verify product deleted
TC07_Search Product by Category
    verify product inlists
TC08_Search Product by Code
    Search product
    input text         ${AddProduct_Input}     ${valid_code}
    sleep    2s
    wait until element is visible    ${search_result}
    sleep    4s
TC09_Search Non-existent Product
    Search product
    input text         ${AddProduct_Input}     ${invalid_code}
    wait until element is visible    ${Search_invalid_result}
    sleep    2s
TC10_View Product Details
    click "Details" button
    Product details page displayed
*** Keywords ***
Click "Upload" button
    click element                       ${Web_AddProduct_Dropdown}
    click element                       ${Web_AddProduct_Laptop_Option}
    wait until element is visible       ${Web_AddProduct_Popup}
Upload Product Details
    input text                          ${Web_AddProduct_Name_Input}        Laptop Apple MacBook Air
    input text                          ${Web_AddProduct_Price_Input}       21490000
    click element                       ${Web_AddProduct_HSX_Dropdown}
    click element                       ${HangSanXuat}
    input text                          ${Web_AddProduct_HDH_Input}         macOS
    input text                          ${Web_AddProduct_Ram_Input}         8GB
    input text                          ${Web_AddProduct_Screen_Input}      13.6"
    input text                          ${Web_AddProduct_CPU_Input}         Apple M2
    input text                          ${Web_AddProduct_Design_Input}      Card tích hợp - 8 nhân GPU
    input text                          ${Web_AddProduct_Infor_Input}       Sự đẳng cấp đến từ ngoại hình của chiếc MacBook Air nhà Apple là điều không thể phủ nhận và khó có dòng sản phẩm cùng phân khúc nào có thể qua mặt được. 
    input text                          ${Web_AddProduct_Pin_Input}         18 giờ
    input text                          ${Web_AddProduct_BaoHanh_Input}     1 năm
    input text                          ${Web_AddProduct_Quality_Input}     20
Upload Product with missing fields      # missing fiels: Pin
    input text                          ${Web_AddProduct_Name_Input}        Laptop Apple MacBook Air
    input text                          ${Web_AddProduct_Price_Input}       21490000
    click element                       ${Web_AddProduct_HSX_Dropdown}
    click element                       ${HangSanXuat}
    input text                          ${Web_AddProduct_HDH_Input}         macOS
    input text                          ${Web_AddProduct_Ram_Input}         8GB
    input text                          ${Web_AddProduct_Screen_Input}      13.6"
    input text                          ${Web_AddProduct_CPU_Input}         Apple M2
    input text                          ${Web_AddProduct_Design_Input}      Card tích hợp - 8 nhân GPU
    input text                          ${Web_AddProduct_Infor_Input}       Sự đẳng cấp đến từ ngoại hình của chiếc MacBook Air nhà Apple là điều không thể phủ nhận và khó có dòng sản phẩm cùng phân khúc nào có thể qua mặt được.
    # missing fiels: Pin
    input text                          ${Web_AddProduct_BaoHanh_Input}     1 năm
    input text                          ${Web_AddProduct_Quality_Input}     20
Verify error message displayed
    wait until element is visible    xpath=//span[text()='Dung lượng pin được trống']
    click element                   xpath=(//button[text()='Hủy'])[1]
    wait until element is visible       ${Web_AddProduct_Title}
Upload Product Image
    [Arguments]                         ${image_path}
    Log To Console      Uploading file from: ${image_path}
    Choose File                         ${Web_AddProduct_IMG_Upload}        ${image_path}
    Sleep  2s  # Đợi file upload hoàn tất
    Log    "Image uploaded successfully."

Verify error message
    Wait Until Element Is Visible    ${error_message}
Click "Update" button without any change
    click element                    xpath=(//button[text()='Cập nhật'])[1]
    wait until element is visible    xpath=//label[text()='Dung lượng Pin']
Click "Update" button
    click element       xpath=(//button[text()='Cập nhật'])[1]
    wait until element is visible    xpath=//label[text()='Dung lượng Pin']
    clear element text        ${Web_AddProduct_Pin_Input}
    input text              ${Web_AddProduct_Pin_Input}         20 gio
Click "Submit" button
    click element    ${Web_AddProduct_Submit_Button}
    Sleep    3s
Click "Delete" button
    click element    xpath=(//button[text()='Xóa'])[1]
Verify Product Upload Success
    Sleep   3s
    ${alert_text}    Handle Alert    ACCEPT
    Log To Console    "Alert message: ${alert_text}"
    Wait Until Element Is Visible    xpath=//table[@class='table table-hover sanPhamTable ']
    Sleep    2s
Verify product inlists
    click element    xpath=//select[@name='danhMucId']
    click element    xpath=(//option[@value='1'])[2]
    click element    xpath=//select[@name='hangSXId']
    click element    xpath=(//option[text()='Apple'])[1]
    click element    xpath=//select[@name='donGia']
    click element    xpath=//option[text()='Tất cả giá']
    click element    xpath=//select[@name='sapXepTheoGia']
    click element    xpath=//option[text()='Sắp xếp theo giá tăng dần']
    click element    xpath=//button[@id='btnDuyetSanPham']
    Wait Until Element Is Visible    xpath=//table[@class='table table-hover sanPhamTable ']
    Sleep    5s
Search product
    click element                       xpath=//input[@id='searchById']
click "Details" button
    click element                       xpath=(//button[@class='btn btn-warning btnChiTiet'])[1]
Product details page displayed
    wait until element is visible       xpath=//h3[text()='Chi tiết sản phẩm']
    sleep    5s
    click element                       xpath=//button[text()='Đóng']