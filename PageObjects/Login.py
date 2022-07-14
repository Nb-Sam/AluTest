# Login functionality Locators

User_icon = "//i[@class='meigee-account']"
Login_Header_Link = "//div[@class='dropdown-item account']//a[text()='Log In']"
Logout_Header_Link = "//div[@class='dropdown-item account']//a[text()='Log Out']"
Login_form = "//div[@class='login-container']//span[text()='Sign In']"
Close_popup = "//a[@class='close_no_thanks']"
User_id_inputbox = "//input[@name='login[username]']"
Password_inputbox = "//input[@name='login[password]']"
Forgot_password_link = "//fieldset[@class='fieldset login']//span[text()='Forgot Your Password?']"
Keep_me_signed_in_checkbox = "//label[text()='Keep me signed in']"
Signin_submit_button = "//button[@id='send2' and @class='action login primary']"
Login_page_signup_link = "//div[@class='loginpage-signup-link']//a[text()='Sign Up']"
Invalid_User_info_list = [{"User_ID": "gobinda.07@gmail.com", "Password": "Test123"}]
Valid_User_info_list = [{"User_ID": "gobinda.cemk07@gmail.com", "Password": "Test123"}, {"User_ID": "ggg@mmm.com", "Password": "test123"}, {"User_ID": "aaa@sss.com", "Password": "test123"}]
Invalid_login_msg_element = "//div[text()='The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.']"

# Mandatory field errors
Email_Error = "//input[@name='login[username]' and @aria-describedby='email-error']"
Password_error = "//input[@name='login[password]' and @aria-describedby='pass-error']"









