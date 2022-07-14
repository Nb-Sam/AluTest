*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../PageObjects/Signup_form.py
Variables   ../TestData/Testdata.py
Resource    ../Resources/PLP_Keywords.robot
Library     DataDriver   ../TestData/Testdata_Signup.xlsx


Suite Setup     Open Sign_Up Page
Suite Teardown      Close All Browsers
Test Template       SingnUp_from_Invalid_Testcases

*** Variables ***
${URL}      https://www.ddecor.com/

@{month_List}       MM   January     February       March       April       May     June    July    August   September      October     November  December
@{Gender_list}      ${EMPTY}        Male        FEMALE
*** Test Cases ***
Invalid_testcase   Using        ${Firstname_field}     ${Lastname_field}       ${Email_field}      ${Mobile_field}        ${Password_field}         ${Confirm_Password_field}

#testcase
 #   Mouse Over    ${Profile_icon}
  #  Click Link    ${Signup_link}
#    Element Should Be Visible    ${Firstname}
  #  Verify the Day Dropdown
  #  Verify the Month Dropdown
  #  Verify the Year Drop down
 #   Validate the Gender Drop down
 #   Error should be Displayed
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
        
Verify the Day
        @{day}=  Get List Items   ${DOB_Day_dropdown}
        FOR    ${a}    IN    @{day}
            Continue For Loop If    "${a}"=="DD"
            FOR    ${ran}    IN RANGE    1    19
                IF  ${a} == ${ran}
                    Log To Console    ${a}
                END
            END
        END
Verify the Day Dropdown
        @{day}=  Get List Items   ${DOB_Day_dropdown}
        FOR    ${a}    IN    @{day}
        Continue For Loop If    "${a}"=="DD"
        IF    ${a}>=1
            IF    ${a}<=31
                FOR    ${ran}    IN RANGE    1    31
                    IF  ${a} == ${ran}
                        Log To Console    ${a}
                    END
                END
            ELSE
                Log To Console    DAY number exceeding 31 Invalid
            END
        ELSE
             Log To Console    Day number less than 1 Invalid
        END
        END

Verify the Month Dropdown
        @{Month}=   Get List Items    name:dob_month
        FOR    ${Month_M}    IN    @{Month}
            FOR    ${M}    IN    @{month_List}
                Continue For Loop If  "${Month_M}"=="${M}"
            END
            #Log To Console    ${Month_M} Drop down Verified
        END
        ${Month_default_selection}=     Get Selected List Value    name:dob_month
Select Gender
    Select From List By Index    ${Gender_dropdown}     2
Verify the Year Drop down
        @{Year_list}=   Get List Items    ${DOB_year_dropdown}
        ${max}=    Evaluate    max(@{Year_list})
        ${min}=    Evaluate    min(@{Year_list})
        Log To Console    ${max}
        #Log To Console  @{Year_list}[-2]
#        Log To Console    @{Year_list}\

 #       FOR    ${a}    IN    @{Year_list}
 #           Skip If    ${a}="YY"
  #          IF    ${a} <=1
#
 #           END
 #       END



Validate the Gender Drop down
        @{Gender_values}=       Get List Items    //select[@id='gender']
        FOR    ${gen}    IN    @{Gender_values}
            FOR    ${element}    IN    @{Gender_list}
                IF  "${element}" == "${gen}"
                    Log To Console    ${element}
                END
            END
        END
        #Log To Console    Mismatch in Gender values


Error should be Displayed
        Element Should Be Enabled    ${SingUp_mage_error}

Select valid date of Birth
        Select From List By Index    ${DOB_Day_dropdown}        3
        Select From List By Index    ${DOB_Month_dropdown}        3
        Select From List By Index    ${DOB_year_dropdown}        3
Click on submit button
    Click Element    ${SignUP_button}

        



Open Sign_Up Page
    Open Browser     ${URL}      chrome
    Go To    https://www.ddecor.com/customer/account/create/


Close pop up and Verify Homepage
        Run Keyword And Continue On Failure    Close PopUp
        Set Selenium Implicit Wait    5 seconds
        Verify Homepage
Close PopUp
    click element    ${close_popup}
Verify Homepage
    Element Should Be Visible    ${Search_button}


