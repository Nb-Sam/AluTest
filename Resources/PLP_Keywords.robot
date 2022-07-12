*** Settings ***
Library    SeleniumLibrary
Variables   ../PageObjects/PLP_page_Objects.py

*** Variables ***

*** Keywords ***
Open Rugs PLP and Verify
    Click Link      ${Rugs}
    Element Should Be Visible       ${Rugs_PLP_page}
Fetch the PLP Products count
    log to console      ${Products_count.text}



