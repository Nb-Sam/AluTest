*** Settings ***
Library     SeleniumLibrary
Variables       ../PageObjects/Search.py

*** Variables ***
${URL}      https://www.ddecor.com/

*** Keywords ***
Close PopUp
    TRY
        Element Should Not Be Visible    ${close_popup}
    EXCEPT
        Click Element    ${close_popup}
        Sleep    3
        TRY
            Element Should Not Be Visible    ${close_popup}
        EXCEPT
            Click Element    ${close_popup}
            Sleep    3
            TRY
                Element Should Not Be Visible    ${close_popup}
            EXCEPT
                Click Element    ${close_popup}
            END
        END
    END

Open Chrome Browser
    Open Browser        ${URL}      Chrome
    Close PopUp

Verify Homepage
    Element Should Be Visible    ${Search_button}