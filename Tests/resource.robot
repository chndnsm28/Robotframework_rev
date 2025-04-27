*** Settings ***
Documentation      Reusable code for the test cases
Library            SeleniumLibrary


*** Variables ***
${user_name}    Admin
${user_password}    admin123
${after_login}    xpath://span[text() = 'PIM']
${addition_employee_screen_wait}    xpath://a[text() = 'Add Employee']
${url}           https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
open the browser with login page url
    Create Webdriver    Chrome
    Go To    ${url}
    Wait Until Element Is Visible   xpath://input[@name = 'username']

fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        XPATH://input[@name = 'username']    ${username}
    Input Password    xpath://input[@name = 'password']    ${password}
    Click Button    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

wait until elements in next page is loaded
    [Arguments]    ${locator}
    Wait Until Element Is Visible           ${locator}