*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../PageObjects/Homepage.py

*** Variables ***

*** Keywords ***
User Profile Icon Should Be Visible
    [Documentation]  Home Page Should Contain User Profile Icon
    Element Should Be Visible    ${User_icon}

Shopping Cart Icon Should Be Visible
    [Documentation]  Home Page Should Contain Shopping Cart Icon
    Element Should Be Visible    ${Shopping_cart_icon}

Wish List Icon Should Be Visible
    [Documentation]  Home Page Should Contain Wishlist Icon
    Element Should Be Visible    ${Wishlist_icon}

Login Header Link Should Be Visible
    [Documentation]  User Profile Dopdown List Should Contain Login Header Link
    Mouse Over    ${User_icon}
    Sleep    2
    Element Should Be Visible    ${Login_header_link}

Login Header Link Should Not Be Visible
    [Documentation]  User Profile Dopdown List Should Not Contain Login Header Link
    Mouse Over    ${User_icon}
    Sleep    2
    Element Should Not Be Visible    ${Login_header_link}

Logout Header Link Should Be Visible
    [Documentation]  User Profile Dopdown List Should Contain Logout Header Link
    Mouse Over    ${User_icon}
    Sleep    2
    Element Should Be Visible    ${Logout_header_link}

Logout Header Link Should Not Be Visible
    [Documentation]  User Profile Dopdown List Should Not Contain Logout Header Link
    Mouse Over    ${User_icon}
    Sleep    2
    Element Should Not Be Visible    ${Logout_header_link}


