*** Settings ***
Library     SeleniumLibrary
Resource        ../Resources/HomePageValidationResource.robot
Resource        ../Resources/GenericKeyword.robot
Resource        ../Resources/Login_Resources.robot
Variables       ../PageObjects/search.py
#Library     DataDriver          ../TestData/InvalidLoginData.csv
Suite Setup     Open My Browser
Suite Teardown      Close Browsers
#Test Template   Invalid Login


*** Test Cases ***
Home Page should Contain Profile Icon
    Go To    ${HomePageUrl}
    ${CurrentUrl}=      Get Location
    Log To Console    ${CurrentUrl}
    User Profile Icon Should Be Visible

Login Header Link Should Be Available on Home Page
    Go To    ${HomePageUrl}
    Login Header Link Should Be Visible
    Logout Header Link Should Not Be Visible

Search Button Should Be There on Home Page
    Go To    ${HomePageUrl}
    Element Should Be Visible    ${Search_button}

Home Page should Contain Wishlist Icon
    Go To    ${HomePageUrl}
    Wish List Icon Should Be Visible

Signin Form Should Be Opened
    Go To    ${HomePageUrl}
    Validate Sign In Form


