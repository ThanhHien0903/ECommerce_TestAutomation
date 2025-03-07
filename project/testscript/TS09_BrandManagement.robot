*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Suite Setup     Run Keywords    Start Test      AND     Login with Admin
Test Setup      Navigate To Brand Management Page
Suite Teardown   Close All Browsers
*** Variables ***
${VALID_BRAND_NAME}             LG
${EMPTY_BRAND_ERROR}            Tên hãng sản xuất không được trống
${DUPLICATE_BRAND_ERROR}        Tên han sản phẩm đã tồn tại
${UPDATED_BRAND_NAME}           Microsoft
*** Test Cases ***
TC_BRAND_001: Add Brand with Valid Data
    Click "Add brand"
    Enter a new brand name                  ${VALID_BRAND_NAME}
    Click "Save"
    Verify displayed successfully
TC_BRAND_002: Add Brand with Empty Name
    Click "Add brand"
    Click "Save"
    Verify error message displayed          ${EMPTY_BRAND_ERROR}
TC_BRAND_003: Add Duplicate Brand
    Click "Add brand"
    Enter a new brand name                  ${VALID_BRAND_NAME}
    Click "Save"
    Verify error message displayed          ${DUPLICATE_BRAND_ERROR}
TC_BRAND_004: Update Brand with Valid Data
    Select Brand to Edit
    Enter a new brand name                  ${UPDATED_BRAND_NAME}
    Click "Save"
    Verify displayed successfully
TC_BRAND_005: Update Brand with Empty Name
    Select Brand to Edit
    Clear category name
    Click "Save"
    Verify error message displayed          ${EMPTY_BRAND_ERROR}
TC_BRAND_006: Delete Brand
    Select Brand to Delete
    Confirm Deletion
    Verify displayed successfully
*** Keywords ***
Click "Add brand"
    click element                           ${Web_Brand_Add_Button}
    wait until element is visible           ${Web_Brand_Add_Popup}
Enter a new brand name
    [Arguments]                             ${VALID_BRAND_NAME}
    input text                              ${Web_Brand_NameBrand_Input}       ${VALID_BRAND_NAME}
Click "Save"
    click element                           ${Web_Brand_Save_Button}
    Sleep   3s
Verify displayed successfully
    ${alert_text}    Handle Alert    ACCEPT
    Wait Until Element Is Visible               ${Web_Brand_CategoryTable}
    scroll element into view                    ${Web_Category_PageNumber}
    click element                               ${Web_Category_PageNumber}
    Sleep    2s
    Log To Console    Alert message: "${alert_text}"
Verify error message displayed
    [Arguments]                                 ${expected_message}
    Wait Until Page Contains                    ${expected_message}
    click element                               ${Web_Category_Huy_Button}
    sleep    2s
    Log To Console    "Error message displayed: ${expected_message}"
Select Brand to Edit
    click element                               ${Web_Category_PageNumber}
    sleep    2s
    click element                               ${Web_Brand_Update_Button}
    wait until element is visible               ${Web_Brand_Add_Popup}
Clear category name
    clear element text                          ${Web_Brand_NameBrand_Input}
Select Brand to Delete
    scroll element into view                    ${Web_Category_PageNumber}
    click element                               ${Web_Category_PageNumber}
    sleep    2s
    click element                               ${Web_Brand_Delete_Button}
Confirm Deletion
    Handle Alert    ACCEPT
    Sleep    2s







