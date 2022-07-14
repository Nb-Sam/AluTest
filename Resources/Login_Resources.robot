*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/GenericKeyword.robot


*** Variables ***
${User_icon}    //i[@class='meigee-account']
${Login_Header_Link}     //div[@class='dropdown-item account']//a[text()='Log In']
${Logout_Header_Link}    //div[@class='dropdown-item account']//a[text()='Log Out']
${Login_form}       //div[@class='login-container']//span[text()='Sign In']
${Close_popup}      //a[@class='close_no_thanks']
${User_id_inputbox}  //input[@name='login[username]']
${Password_inputbox}     //input[@name='login[password]']
${Forgot_password_link}     //fieldset[@class='fieldset login']//span[text()='Forgot Your Password?'
${Signin_submit_button}     //button[@id='send2' and @class='action login primary']
${Invalid_User_info_list}   [{"User_ID": "gobinda.07@gmail.com", "Password": "Test123"}]
${Valid_User_info_list}     [{"User_ID": "gobinda.cemk07@gmail.com", "Password": "Test123"}]
${Invalid_login_msg_element}    //div[text()='The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.']
${user_id_matched}      false
${password_matched}     false



*** Keywords ***

Input Username
    [Arguments]     ${UserName}
    Input Text    ${User_id_inputbox}    ${UserName}

Input Passwd
    [Arguments]     ${Password}
    Input Password    ${Password_inputbox}    ${Password}

Click Login Header Link
    Click Element    ${Login_Header_Link}

Click Logout Header Link
    Mouse Over      ${User_icon}
    Page Should Contain Element    ${Logout_Header_Link}
    Sleep    5
    Click Element    ${Logout_Header_Link}

Error Message Should Be Visible
    Page Should Contain    "The account sign-in was incorrect"

Open Login Form
    Mouse Over      ${User_icon}
    Page Should Contain Element    ${Login_Header_Link}
    Sleep    5
    Click Element   ${Login_Header_Link}
    Element Should Be Visible   ${Login_form}
    Element Should Be Visible   ${Password_inputbox}
    Element Should Be Visible   ${Password_inputbox}
    Element Should Be Visible   ${Signin_submit_button}

Submit Filled Up Login Form
    Click Button    ${Signin_submit_button}

Login Should Fail
    Page Should Contain Element    ${Login_Header_Link}
    Page Should Not Contain Element    ${Logout_Header_Link}
#    Sleep    10

Login Should Pass
    Page Should Not Contain Element    ${Login_Header_Link}
    Page Should Contain Element    ${Logout_Header_Link}

Logout Should Fail
    Page Should Not Contain Element    ${Login_Header_Link}
    Page Should Contain Element    ${Logout_Header_Link}
#    Sleep    10

Logout Should Pass
    Page Should Contain Element    ${Login_Header_Link}
    Page Should Not Contain Element    ${Logout_Header_Link}

Validate Sign In Form
    [Documentation]  Inspect different elements on Sign In form
    Go To Sign Form
    Element Should Be Visible   ${Login_form}
    Element Should Be Visible   ${User_id_inputbox}
    Element Should Be Visible   ${Password_inputbox}
    Element Should Be Visible   ${Forgot_password_link}
    Element Should Be Visible   ${Signin_submit_button}
    Element Should Be Visible   ${Keep_me_signed_in_checkbox}
    Element Should Be Visible    ${Login_page_signup_link}

Go To Sign Form
    Mouse Over    ${User_icon}
    Sleep    2
    Click Link    ${Login_Header_Link}




