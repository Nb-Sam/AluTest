# Sing up form x path's
Firstname = "id:firstname"
Lastname = "id:lastname"
Email = "name:email"
Mobile = "id:telephone"
Sign_up_for_news_letter = "//label[@for=is_subscribed]"
DOB_Day_dropdown = "//select[@name='dob_day']"
DOB_Month_dropdown = "name:dob_month"
DOB_year_dropdown = "name:dob_year"
Gender_dropdown = "//select[@id='gender']"
Password = "id:password"
Confirm_password = "id:password-confirmation"
Back_button = "//a[@class='action back']"
SignUP_button = "//button[@title='Sign Up']"

# Sign up form invalid xpath and variables
# Mandatory field error xpath's
Firstname_error = "//input[@aria-describedby='firstname-error']"
Lastname_error = "//input[@aria-describedby='lastname-error']"
Email_error = "//input[@aria-describedby='email_address-error']"
Mobile_error = "//input[@aria-describedby='telephone-error']"
DOB_Day_dropdown_error = "//select[@aria-describedby='dob_day-error']"
DOB_Month_dropdown_error = "//select[@aria-describedby='dob_month-error']"
DOB_Year_dropdown_error = "//select[@aria-describedby='dob_year-error']"
Password_error = "//input[@aria-describedby='password-error']"
Confirm_password_error = "//input[@aria-describedby='password-confirmation-error']"

SignUp_input_error = "//input[@aria-invalid='true]"
SignUp_form_error_path = "//*[contains(text(),'This is a required field')]"
SingUp_mage_error = "//div[@class='mage-error']"

# homepage locators
Profile_icon = "//i[@class='meigee-account']"
Signup_link = "//div[@class='dropdown-item account']//a[text()='Sign Up']"










