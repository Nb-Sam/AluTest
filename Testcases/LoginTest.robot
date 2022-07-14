*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/HomePageValidationResource.robot
Resource        ../Resources/GenericKeyword.robot
Resource        ../Resources/Login_Resources.robot
Library         DataDriver          ../TestData/InvalidLoginData.csv
Suite Setup         Open My Browser
Suite Teardown      Close Browsers
Test Template       User Login

*** Test Cases ***
Login Test using User Id as ${UserName} and Password as ${Password}
#Right User Empty Password       gobinda.cemk07@gmail.com        ${EMPTY}
#Right User Wrong Password       gobinda.cemk07@gmail.com        hfdfhjdhdfg
#Empty User Right Password       ${EMPTY}                        Test123
#Wrong User Right Password       gobinda@gmai               Test123
#Wrong User Wrong Password       gobinda@gmail.com               kdfgrhefg
#right User Right Password       gobinda.cemk07@gmail.com               Test123

*** Keywords ***
User Login
    [Arguments]     ${UserName}     ${Password}
#    Open My Browser
    Go To    ${HomePageUrl}
    Close PopUp
    Go To Sign Form
    Input Username  ${UserName}
    Input Passwd    ${Password}
    Submit Filled Up Login Form
    Set Global Variable    $end_of_test     ${False}
    IF    "${UserName}" == "${EMPTY}"
        Element Should Be Visible    ${Email_Error}
        Login Should Fail
        Set Global Variable    $end_of_test     ${True}
    END
    IF    "${end_of_test}" == "${False}"
        IF    "${Password}" == "${EMPTY}"
            Element Should Be Visible    ${Password_error}
            Login Should Fail
            Set Global Variable    $end_of_test     ${True}
        END
    END
    IF    "${end_of_test}" == "${False}"
        TRY
             Should Match Regexp    ${UserName}    [A-Za-z0-9.]+@[a-zA-Z0-9]+.com
    #         Should Not Be Empty    ${UserName}
    #         Should Not Be True    "${UserName}" == "${EMPTY}"
        EXCEPT
            Element Should Be Visible    ${Email_Error}
            Login Should Fail
            Set Global Variable    $end_of_test     ${True}
        END
    END
    IF    "${end_of_test}" == "${False}"
        Set Global Variable    $userMatched     ${False}
        FOR    ${profile}    IN    @{Valid_User_info_list}
            IF    '${UserName}' == '${profile["User_ID"]}'
                IF    '${Password}' == '${profile["Password"]}'
                    Login Should Pass
                    Sleep    5
                    Click Logout Header Link
                    Logout Should Pass
                    Sleep    5
                    Set Global Variable    $userMatched     ${True}
                    Set Global Variable    $end_of_test     ${True}
                    Exit For Loop
                ELSE
                    Login Should Fail
                    Set Global Variable    $end_of_test     ${True}
                    Exit For Loop
                END
            ELSE
                Continue For Loop
            END
        END
    END
    IF    "${end_of_test}" == "${False}"
        IF    ${userMatched} == ${False}
            Login Should Fail
            Set Global Variable    $end_of_test     ${True}
        END
    END
#    Close Browsers



