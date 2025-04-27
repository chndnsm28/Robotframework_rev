*** Settings ***
Documentation    Validate the login form
Library    SeleniumLibrary


*** Test Cases ***
Validate unsuccessful login
    open the browser with login page url
    fill the login form
    wait until it checks and displays error msg
    verify error msg is correct
*** Variables ***
${error_msg}    css:.oxd-alert-content.oxd-alert-content--error
${url}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Keywords ***
open the browser with login page url
    Create Webdriver    Chrome
    Go To    ${url}
    Wait Until Element Is Visible   xpath://input[@name = 'username']
fill the login form
    Input Text        XPATH://input[@name = 'username']    Adminew
    Input Password    xpath://input[@name = 'password']    admin1232
    Click Button    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

wait until it checks and displays error msg
    Wait Until Element Is Visible    ${error_msg}

verify error msg is correct
    ${msg}=    Get Text    css:.oxd-alert-content.oxd-alert-content--error
    Element Text Should Be    ${error_msg}    Invalid credentials

