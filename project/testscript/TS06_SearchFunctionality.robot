*** Settings ***
Documentation    Test login with valid credentials
Resource        ../environment/library.robot
Suite Setup     Run Keywords    Start Test      AND     Login with user
Suite Teardown   Close All Browsers

*** Variables ***
${VALID_KEYWORD}            Dell
${INVALID_KEYWORD}          xyz123
${EMPTY_KEYWORD}            ${EMPTY}
${ERROR_EMPTY_MESSAGE}      Vui lòng nhập từ khóa
${SPECIAL_CHARACTERS}       @#$%^
${WHITESPACE_KEYWORD}         Le  no   vo
${UPPERCASE_KEYWORD}        LeNOvo
${SEARCH_RESULT}            Kết quả tìm kiếm
${NO_RESULTS_MESSAGE}       Không tìm thấy kết quả nào
*** Test Cases ***
TC_SR_001: Search with Valid Keyword
    [Documentation]    Kiểm tra tìm kiếm với từ khóa hợp lệ
    Search product                      ${VALID_KEYWORD}
    Verify displayed successfully       ${SEARCH_RESULT}
    Log To Console    "Search with valid keyword succeeded."
TC_SR_002: Search with Invalid Keyword
    [Documentation]    Kiểm tra tìm kiếm với từ khóa không hợp lệ
    Search product                      ${INVALID_KEYWORD}
    Verify displayed successfully       ${NO_RESULTS_MESSAGE}
    Log To Console    "Search with invalid keyword returned no results."
TC_SR_003: Search with Empty Keyword
    [Documentation]    Kiểm tra tìm kiếm khi không nhập gì
    Search product                      ${EMPTY_KEYWORD}
    Verify displayed successfully       ${ERROR_EMPTY_MESSAGE}
    Log To Console    "Empty search shows error message."
TC_SR_004: Search with Special Characters
    [Documentation]    Ký tự đặc biệt
    Search product                      ${SPECIAL_CHARACTERS}
    Verify displayed successfully       ${NO_RESULTS_MESSAGE}
    Log To Console    "Search with special characters returned no results."
TC_SR_005: Search with Leading/Trailing Spaces
    [Documentation]    Từ khóa có khoảng trắng
    Search product                      ${WHITESPACE_KEYWORD}
    Verify displayed successfully       ${SEARCH_RESULT}
    Log To Console    "Search with whitespace trimmed successfully."
TC_SR_006: Case-Insensitive Search
    [Documentation]    Không phân biệt hoa thường
    Search product                      ${UPPERCASE_KEYWORD}
    Verify displayed successfully       ${SEARCH_RESULT}
    Log To Console    "Case-insensitive search succeeded."
TC_SR_007: Filter Products by Price Range
     [Documentation]    Lọc sản phẩm theo mức giá
     Search product                     ${VALID_KEYWORD}
     Filter Products by price
     Click Filter Button
     Verify displayed successfully      ${SEARCH_RESULT}
TC_SR_008: Filter by Category
    [Documentation]    Lọc sản phẩm theo danh mục Laptop
    Search product                  ${VALID_KEYWORD}
    Filter Products By Category
    Click Filter Button
    Verify displayed successfully    ${SEARCH_RESULT}
TC_SR_009: Filter by Brand
    [Documentation]    Lọc sản phẩm theo thương hiệu Dell
    Search product                  ${VALID_KEYWORD}
    Filter Products By Brand
    Click Filter Button
    Verify displayed successfully    ${SEARCH_RESULT}
TC_SR_010: Combine Multiple Filters
    [Documentation]    Kết hợp nhiều bộ lọc
    Search product                      ${VALID_KEYWORD}
    Filter Products by price
    Filter Products By Category
    Filter Products By Brand
    Click Filter Button
    Verify displayed successfully    ${SEARCH_RESULT}
TC_SR_011: No Matching Results
    [Documentation]    Lọc sản phẩm với giá 2M (không có kết quả)
    Search product                  ${VALID_KEYWORD}
    Filter Products by price 2M
    Click Filter Button
    Verify displayed successfully    ${NO_RESULTS_MESSAGE}
*** Keywords ***
Search product
    [Arguments]   ${name_product}
    Input text                            ${Web_SEARCH_BOX}    ${name_product}
    sleep    4s
    Click Button                          ${Web_SEARCH_BUTTON}
    sleep   2s
Verify displayed successfully
    [Arguments]             ${expected_message}
    sleep    2s
    Wait Until Page Contains                    ${expected_message}
    Log To Console    "Message displayed: ${expected_message}"
Filter Products by price
    click element           xpath=//select[@name='range']
    click element           xpath=//option[@value='6-trieu-den-10-trieu']
Filter Products By Category
    click element           xpath=//select[@name='brand']
    click element           xpath=//option[@value='Laptop']
    sleep    3s
Filter Products By Brand
    click element           xpath=//select[@name='manufactor']
    click element           xpath=//option[text()='Dell']
Click Filter Button
    click element           xpath=//input[@value='Lọc sản phẩm']
Filter Products by price 2M
    click element           xpath=//select[@name='range']
    click element           xpath=//option[@value='duoi-2-trieu']



