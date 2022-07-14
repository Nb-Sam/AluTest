*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables   ../PageObjects/Login.py

*** Variables ***
${HomePageUrl}      https://www.ddecor.com/

*** Keywords ***
Open My Browser
    Open Browser     ${HomePageUrl}      chrome
    Maximize Browser Window
    Sleep    1
    Close PopUp
    Verify Homepage

Close Browsers
    Close All Browsers

Verify Homepage
    Element Should Be Visible    ${User_icon}

Close PopUp
    TRY
        Element Should Not Be Visible    ${Close_popup}
    EXCEPT
        Click Element    ${Close_popup}
        Sleep    3
        TRY
            Element Should Not Be Visible    ${Close_popup}
        EXCEPT
            Click Element    ${Close_popup}
            Sleep    3
            TRY
                Element Should Not Be Visible    ${Close_popup}
            EXCEPT
                Click Element    ${Close_popup}
            END
        END
    END

