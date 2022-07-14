*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../PageObjects/Signup_form.py
Variables   ../TestData/Testdata.py
Resource    ../Resources/PLP_Keywords.robot
Library     DataDriver   ../TestData/Testdata_Signup.xlsx       sheet_name=Valid_Testcases
Resource    ../Resources/SignUP_Form_Keywords.robot

