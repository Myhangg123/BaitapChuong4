*** Settings ***
Documentation     viet test case trang login OrangeHRM
Library    SeleniumLibrary

*** Variables ***
${URL}             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}      Admin
${PASSWORD}      admin123
${USERNAME1}    AAAA
${PASSWORD1}    aaaa123

*** Test Cases ***
Dang nhap thanh cong OrangeHRM
    #1. Mở trình duyệt và truy cập trang login
    Mo trinh duyet OrangeHRM
    #2. Nhập thông tin đăng nhập hợp lệ và nhấn đăng nhập
    Dang nhap OrangeHRM    ${USERNAME}    ${PASSWORD}
    #3. Kiểm tra đăng nhập thành công
    Kiem tra dang nhap thanh cong
    #4. Đóng trình duyệt
    Dong trinh duyet

Dang nhap that bai OrangeHRM
    #1. Mở trình duyệt và truy cập trang login
    Mo trinh duyet OrangeHRM
    #2. Nhập thông tin đăng nhập sai và nhấn đăng nhập
    Dang nhap OrangeHRM    ${USERNAME1}    ${PASSWORD1}
    #3. Kiểm tra đăng nhập thất bại
    Kiem tra dang nhap that bai
    #4. Đóng trình duyệt
    Dong trinh duyet

*** Keywords ***
Mo trinh duyet OrangeHRM
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s

Dang nhap OrangeHRM
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    

Kiem tra dang nhap thanh cong
    Page Should Contain Element    xpath=//h6[text()='Dashboard']
    Page Should Contain    Dashboard

Kiem tra dang nhap that bai
    Page Should Contain    Invalid credentials

Dong trinh duyet
    Close Browser
