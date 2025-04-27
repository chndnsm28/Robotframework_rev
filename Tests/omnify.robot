*** Settings ***
Documentation   End to end validation of employee addition
Library    SeleniumLibrary
Library    Collections
#Test Setup   open the browser with login page url
#Test Teardown    Close Browser
Resource    resource.robot
Resource    ../PO/LoginPage.robot

*** Test Cases ***
Validate employee addition
    open the browser with login page url
    fill the login form    ${user_name}    ${user_password}
    wait until elements in next page is loaded    ${after_login}
    LoginPage.click on PIM link
    wait until elements in next page is loaded    ${addition_employee_screen_wait}
    LoginPage.click on add employee
    wait until elements in next page is loaded    ${add_emp_wait}
    LoginPage.enter the data of the employee for creation
    LoginPage.submit the data to add the employee
    LoginPage.save the data in employee page
    LoginPage.navigate to list of data and match with expected data

    #all test cases
    #newchanges
    #all
    #hii tester



        
        
        



