*** Settings ***
Library         SeleniumLibrary
Test Teardown   Close All Browsers
Suite Setup     Log to console  Setup!!
Suite Teardown  Log to console  Goodbye!!

*** Variables *** 
${BROWSER}  gc
${MAIN_URL}  https://vaccine-haven.herokuapp.com/
${REGISTER_URL}  https://vaccine-haven.herokuapp.com/reservation
${INFO_URL}  https://vaccine-haven.herokuapp.com/info
${INFO_VACCINE_URL}  https://vaccine-haven.herokuapp.com/info/9621054573436
${ID}  9621054573436
${SITE_NAME}  OGYHSite
${VACCINE_NAME}  Sinovac

*** Keywords ***
Open Register page @Reservation
    Open Browser  ${REGISTER_URL}  ${BROWSER}
    Set Selenium Speed  0.1
    Log to console  Now at register page @Reservation
    
Input informtion at Register page @Reservation
    Input citizen_id @Reservation
    Select site_name @Reservation
    Select vaccine_name @Reservation
Click Reservation button @Reservation
    Click Button  identifier=reserve__btn
    Log to console  Click reserve__btn @Reservation

Input citizen_id @Reservation
    Input Text  identifier=citizen_id  ${ID}
    Log to console  Input citizen_id @Reservation
Select site_name @Reservation
    Click Element  identifier=site_name
    Select From List by value  identifier=site_name  ${SITE_NAME}
    Log to console  Select site_name @Reservation
Select vaccine_name @Reservation
    Click Element  identifier=vaccine_name
    Select From List by value  identifier=vaccine_name  ${VACCINE_NAME}
    Log to console  Select vaccine_name @Reservation
    
Open Info page @Cancel
    Go To       ${INFO_URL}
    Set Selenium Speed  0.3
    # Log to console  Now at Info page @Cancel
Input citizen_id @Cancel
    Input Text    identifier=citizen_id    ${ID}
    # Log to console  Input citizen_id @Cancel
Click submit button @Cancel
    Click Button  identifier=info__btn
    # Log to console  Click info__btn @Cancel
Click cancel button @Cancel
    Click Button  identifier=cancel__btn
    # Log to console  Click cancel__btn @Cancel

*** Test Cases ***
Reservation test
    Open Register page @Reservation
    Input informtion at Register page @Reservation
    Click Reservation button @Reservation
    
Cancel Reservation test
    Open Info page @Cancel
    Input citizen_id @Cancel
    Click submit button @Cancel
    Click cancel button @Cancel