*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Suite Setup     Run Keywords    Start Test      AND     Login with Admin
Test Setup      Navigate To Categoty Management Page
Suite Teardown   Close All Browsers
*** Variables ***
*** Test Cases ***
TC_CAT_001: Add Category with Valid Data   #Thêm danh mục hợp lệ
     Click "Add Category"
     Enter a new category name                  ${category_name}
     Click "Save"
     Verify Category Added Successfully
TC_CAT_002: Add Category with Empty Name    #Thêm danh mục nhưng để trống
    Click "Add Category"
    Click "Save"
    Verify Error Message Displayed              ${EMPTY_CATEGORY_ERROR}
TC_CAT_003: Add Duplicate Category    #Thêm danh mục trùng tên                           
    Click "Add Category"
    Enter a new category name                   ${category_name}
    Click "Save"
    Verify Error Message Displayed              ${DUPLICATE_CATEGORY_ERROR}
TC_CAT_004: Update Category with Valid Data   #Cập nhật danh mục hợp lệ
    Click "Update Category"
    Enter a new category name                   ${category_name_update}
    Click "Save"
    Verify Category Added Successfully
TC_CAT_005: Update Category with Empty Name   #Cập nhật danh mục với tên trống
    Click "Update Category"
    Clear category name
    Click "Save"
    Verify Error Message Displayed              ${EMPTY_CATEGORY_ERROR}
TC_CAT_006: Delete Category	                            #Xóa danh mục
    Click "Delete Category"
    Confirm Deletion
    Verify Category Added Successfully
*** Keywords ***
Click "Add Category"
    click element                               ${Web_Category_Add_Button}
    wait until element is visible               ${Web_Category_Add_Table}
Enter a new category name
    [Arguments]                                 ${category_name}
    input text                                  ${Web_Category_NameCategory_Input}      ${category_name}
Click "Save"
    click element                               ${Web_Category_Save_Button}
    Sleep   3s
Verify Category Added Successfully
    ${alert_text}    Handle Alert    ACCEPT
    Wait Until Element Is Visible               ${Web_Category_CategoryTable}
    scroll element into view                    ${Web_Category_PageNumber}
    click element                               ${Web_Category_PageNumber}
    Sleep    2s
    Log To Console    Alert message: "${alert_text}"

Verify Error Message Displayed
    [Arguments]    ${expected_message}
    Wait Until Page Contains    ${expected_message}
    click element                               ${Web_Category_Huy_Button}
    sleep    2s
    Log To Console    "Error message displayed: ${expected_message}"
Click "Update Category"
    scroll element into view                    ${Web_Category_PageNumber}
    click element                               ${Web_Category_PageNumber}
    sleep    2s
    click element                               ${Web_Category_Update_Button}
    wait until element is visible               ${Web_Category_Add_Table}
Clear category name
    clear element text                          ${Web_Category_NameCategory_Input}
Click "Delete Category"
    scroll element into view                    ${Web_Category_PageNumber}
    click element                               ${Web_Category_PageNumber}
    click element                               ${Web_Category_Delete_Button}
Confirm Deletion
    Handle Alert    ACCEPT
    Sleep    2s

