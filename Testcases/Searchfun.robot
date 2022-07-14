*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../TestData/Testdata.py
Resource        ../Resources/Common_Keywords.robot

Test Setup     Open Chrome Browser
Test Teardown      Close All Browsers

*** Variables ***

${Placeholder_text}   "Search entire store here..."
*** Test Cases ***
testcase01
        [Documentation]  Search results displayed should be relevant to search keyword
        Click on Search
        Input Keyword into search text field
        Verify Search Result page
        Verify Relevant searched products displayed

testcase03
        [Documentation]  For ecommerce sites - search keyword should suggest similar kind of product/items
        Click on Search
        Input Text    ${Search_textfield}        Prism
        Set Selenium Implicit Wait    5 seconds
        Verify_auto_suggetions
testcase04
        [Documentation]  When user clicks on any link from result and navigates back, then result should be maintained
        Click on Search
        Input Text    ${Search_textfield}    Prism
        Press Keys      NONE    ENTER
        Verify Search Result page
        CLick on any Product
        Go Back
        Go Back
        Wait Until Element Is Visible    ${Search_listing_page}
        #Verify Search Result page
testcase05
         [Documentation]  Total number of search records/results should be displayed on page
         Click Link      ${Rugs}
         Element Should Be Visible       ${Rugs_PLP_page}
         ${count}=  Get Text    ${Products_count}
         log to console    ${count}
testcase06
        [Documentation]  Water text should be provided for user to understand what to search
        Click on Search
        ${search_text_field_placeholder_text}=      Get Element Attribute    ${Search_textfield}    placeholder
        Log To Console    ${search_text_field_placeholder_text}
        Element Attribute Value Should Be    ${Search_textfield}    placeholder    Search entire store here...

Testcase02
        [Documentation]  % Sign in search keyword should not redirect to 404 ERROR
        Click on Search
        Input % in to Search text Field
        Verify Search Result page
        Verify 404 Error page not displaying


*** Keywords ***
CLick on any Product
        Click Element    ${PLP_product}
Verify_auto_suggetions
        ${Names}=  Get Element Attribute    ${Auto_suggestion_name}    data-value
        FOR    ${name}    IN   ${Names}
            Log To Console    ${name}
        END
Verify 404 Error page not displaying
    Page Should Not Contain    "404"
Click on Search
    Click Element   ${Search_button}
Input % in to Search text Field
    Input Text    ${Search_textfield}       %
    Press Keys      NONE    ENTER
Verify Homepage
    Element Should Be Visible    ${Search_button}
Input Keyword into search text field
    Input Text    ${Search_textfield}    Prism
    Press Keys      NONE    ENTER
Verify Search Result page
    Element Should Be Visible     //strong[contains(text(),"Search result")]
Verify Relevant searched products displayed
        @{Products}=  Get WebElements      ${Search_listing_page}
        FOR    ${Product}    IN   @{Products}
            Log To Console    ${Product.text}
        END












