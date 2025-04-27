*** Settings ***
Documentation    working of child window 
Test Setup       Open the browser
Library          SeleniumLibrary
Library          String
Library          Collections
Library          ../customLibrary/Shop.py




*** Variables ***
${url}    https://rahulshettyacademy.com/loginpagePractise/

*** Test Cases ***
Navigate to child window from parent
    Click on link in parent t navigate to child window
    switch to child window and grab the text
    Extract the mail id
    Hello World
    place the email back in parent window username field






*** Keywords ***
Open the browser
    Create Webdriver    Chrome
    Go To    ${url}

Click on link in parent t navigate to child window
    Sleep    2
    Click Element    css:.blinkingText

switch to child window and grab the text
    Switch Window    New
    Wait Until Element Is Visible    xpath://*[@style='height:80px']
    ${text}=     Get Text         css:p[class='im-para red']
    Set Global Variable       ${text}

    
Extract the mail id
    ${f_split}=    Split String    ${text}    at
    ${s_split}=    Get From List   ${f_split}    1
    ${t_split}=    Split String    ${s_split}
    ${email}=      Get From List    ${t_split}    0
    Set Global Variable    ${email}

place the email back in parent window username field
    Switch Window    Main
    Input Text       username    ${email}
    Sleep    3



           


    