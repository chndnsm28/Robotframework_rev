*** Settings ***
Documentation   Variables and locators of login page and employee addition page
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${error_msg}     css:.oxd-alert-content.oxd-alert-content--error

${firstname}     css:.orangehrm-firstname
${middlename}    xpath://input[@name='middleName']
${lastname}      xpath://input[@name='lastName']
${submit_button}    xpath://*[@type='submit']
${addition_employee_screen_wait}    xpath://a[text() = 'Add Employee']
${add_emp_wait}    xpath://button[@type='submit']
@{expected_list}=    Create List   chandan s

*** Keywords ***
click on PIM link
    Click Element        xpath://span[text() = 'PIM']

click on add employee
    Click Element            xpath://a[text() = 'Add Employee']

enter the data of the employee for creation
    Input Text    ${firstname}        chandan
    Input Text    ${middlename}       s
    Input Text    ${lastname}         maheshwarappa

submit the data to add the employee
    Click Button  ${submit_button}
    Wait Until Element Is Visible    xpath://a[text() = 'Employee List']

save the data in employee page
    Wait Until Element Is Visible    xpath:(//button[@type='submit'])[1]
    Click Button        (//button[@type='submit'])[1]
# //div/div[3][@class='oxd-table-cell oxd-padding-cell']/div

navigate to list of data and match with expected data
    @{expected_list}=    Create List    chandan s

    Click Element    xpath://a[text() = 'Employee List']
    Wait Until Element Is Visible       xpath://div[@class='oxd-table-row oxd-table-row--with-border']
    ${datas}=    Get Webelements        xpath://div/div[3][@class='oxd-table-cell oxd-padding-cell']/div
    @{actual_list}=    Create List
    FOR    ${data}    IN    @{datas}
        Log    ${data.text}
        Append To List    ${actual_list}    ${data.text}

    END
    List Should Contain Sub List        ${actual_list}    ${expected_list}