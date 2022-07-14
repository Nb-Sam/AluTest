*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../PageObjects/Signup_form.py
Variables   ../TestData/Testdata.py


*** Variables ***
${URL}      https://www.ddecor.com/

@{month_List}       MM   January     February       March       April       May     June    July    August   September      October     November  December
@{Gender_list}      ${EMPTY}        Male        FEMALE


*** Keywords ***

Verify the Day Dropdown
        @{day}=  Get List Items   ${DOB_Day_dropdown}
        FOR    ${a}    IN    @{day}
        Continue For Loop If    "${a}"=="DD"
        IF    ${a}>=1
            IF    ${a}<=31
                FOR    ${ran}    IN RANGE    1    32
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
    Select From List By Label    ${Gender_dropdown}     Male

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



Verify the Day  #Not used anywhere Test logic
        @{day}=  Get List Items   ${DOB_Day_dropdown}
        FOR    ${a}    IN    @{day}
            Continue For Loop If    "${a}"=="DD"
            FOR    ${ran}    IN RANGE    1    19
                IF  ${a} == ${ran}
                    Log To Console    ${a}
                END
            END
        END