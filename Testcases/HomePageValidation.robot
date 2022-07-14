*** Settings ***
Library     SeleniumLibrary
Resource        ../Resources/HomePageValidationResource.robot
Resource        ../Resources/GenericKeyword.robot
Resource        ../Resources/Login_Resources.robot
#Library     DataDriver          ../TestData/InvalidLoginData.csv
Suite Setup     Open My Browser
Suite Teardown      Close Browsers
#Test Template   Invalid Login


*** Test Cases ***
Home Page should Contain Profile Icon
    Go To    ${HomePageUrl}
    User Profile Icon Should Be Visible

Login Header Link Should Be Available on Home Page
    Go To    ${HomePageUrl}
    Login Header Link Should Be Visible
    Logout Header Link Should Not Be Visible

Signin Form Should Be Opened
    Go To    ${HomePageUrl}
    Validate Sign In Form


