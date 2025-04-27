*** Settings ***
Documentation    Verification of login page with different username and password
Library     SeleniumLibrary
Library     Collections
Test Template    Verify the login for valid and invalid username passwords

*** Variables ***
${url}        https://rahulshettyacademy.com/loginpagePractise/
*** Test Cases ***            username                password
Invalid Username              cgahdna                 learning
Invalid password              Rahulshettyacademy      inhaluf
Special Character             na#2dd                  learning

*** Keywords ***
Verify the login for valid and invalid username passwords
    [Arguments]    ${username}       ${password}
    
    Open the browser
    Fill the login form    ${username}    ${password}
    Hit the submit button
    
*** Keywords ***
Open the browser
    Create Webdriver    Chrome
    Go To   ${url}

Fill the login form
    [Arguments]       ${user_username}    ${user_password}
    Sleep    3
    Input Text        id:username         ${user_username}
    Input Password    id:password         ${user_password}


Hit the submit button
    Click Button     signInBtn