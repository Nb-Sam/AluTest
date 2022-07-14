*** Settings ***
Library     SeleniumLibrary
#Library     ../Resources/func1.py
Library    ../Resources/HelperFunctions.py

*** Variables ***
${ProductPage}    https://www.ddecor.com/bedding-prism-double-bed-sheet-set-189193.html
${Close_popup}      //a[@class='close_no_thanks']
${StypePage}        https://www.ddecor.com/styleexpert/index/index


*** Test Cases ***
SampleTest1
    ${value}=   Add Five To Number  ${1}
    Should Be Equal    ${value}    ${6}

NavigationTest
    Open Browser    https://www.ddecor.com/     chrome
    Maximize Browser Window
    Click Element    ${Close_popup}
    ${loc} =    Get Location
    Log To Console    ${loc}
    Sleep    3

    Go To      ${ProductPage}
    ${loc} =    Get Location
    Log To Console    ${loc}
    Sleep    3

    Go Back
    Go Back
    ${loc} =    Get Location
    Log To Console    ${loc}
    Sleep    5


    Close Browser


