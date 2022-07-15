*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../PageObjects/Signup_form.py
Variables   ../TestData/Testdata.py
Library     DataDriver   ../TestData/Testdata_Signup.xlsx       sheet_name=Invalid_Testcases
Resource    ../Resources/SignUP_Form_Keywords.robot
Resource    ../Resources/Common_Keywords.robot



Suite Setup     Open chrome browser DDT
Suite Teardown      Close All Browsers
Test Template       SingnUp_from_Invalid_Testcases

*** Variables ***


*** Test Cases ***
Invalid_testcase   Using        ${Firstname_field}     ${Lastname_field}       ${Email_field}      ${Mobile_field}        ${Password_field}         ${Confirm_Password_field}

*** Keywords ***
SingnUp_from_Invalid_Testcases
        [Arguments]         ${Firstname_field}      ${Lastname_field}       ${Email_field}      ${Mobile_field}      ${Password_field}       ${Confirm_Password_field}
        Input Text    ${Firstname}     ${Firstname_field}
        Input Text    ${Lastname}    ${Lastname_field}
        Input Text    ${Email}    ${Email_field}
        Input Text    ${Mobile}    ${Mobile_field}
        Input Password    ${Password}    ${Password_field}
        Input Password    ${Confirm_password}    ${Confirm_Password_field}
        Verify the Day Dropdown
        Verify the Month Dropdown
        Verify the Year Drop down
        Validate the Gender Drop down
        Select Gender
        Select valid date of Birth
        Set Selenium Implicit Wait    10
        Click on submit button
        Error should be Displayed

Open chrome browser DDT
    Open Chrome Browser
    Mouse Over   ${Profile_icon}
    Click Element    ${Signup_link}
