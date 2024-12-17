*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/register/
${browser}    chrome
${locator_Firstname}    id=firstname
${locator_error_msg_Firstname}    id=error-firstname
${locator_Lastname}    id=lastname
${locator_error_msg_Lastname}    id=error-lastname
${locator_Email}    id=email
${locator_error_msg_Email}    id=error-email
${locator_Password}    id=password
${locator_error_msg_Password}    id=error-password
${Locator_Mobile_Phone}    id=mobile-phone
${locator_error_msg_Mobile}    id=error-mobile-phone
${locator_Gender}    validation-basic-radio
${locator_error_msg_Gender}    id=validation-basic-gender
${locator_chkSQL}    name=courses.SQL
${locator_chkManual}    name=courses.Test Manual
${locator_chkAutomate1}    name=courses.Automate Test
${locator_chkAutomate2}    name=courses.Automate Test2
${locator_error_msg_Course}    id=validation-basic-courses
${locator_li_nationality}    id=nationality
${locator_select-nationality}    xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_error_msg_Nationality}    id=validation-basic-nationality
${locator_li_select-role}    id=select-role
${locator_select-role}    xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_error_msg_role}    id=validation-basic-nationality
${locator_li_select-plan}    id=select-plan
${locator_select-plan}    xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_error_msg_plan}    id=validation-plan
${locator_btnsignup}    id=btn-sign-up
${locator_reset}    id=reset
${locator_btn-ok}    id=btn-ok

*** Keywords ***
Open Web Browser
    Set Selenium Speed     0.5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Kru P' Beam    5s

Input data for register
    Input Text    ${locator_Firstname}    กนกนวล
    Input Text    ${locator_Lastname}    อินขาน
    Input Text    ${locator_Email}    Beam1234@gmail.com
    Input Text    ${locator_Password}    1234567890
    Input Text    ${Locator_Mobile_Phone}    08222222222
    Select Radio Button    ${locator_Gender}    male
    Select Checkbox    ${locator_chkSQL}
    Select Checkbox    ${locator_chkManual}
    Select Checkbox    ${locator_chkAutomate1}
    Select Checkbox    ${locator_chkAutomate2}
    Select nationality
    Select role
    Select plan

Register Success
    Wait Until Page Contains    Register Success    5s
    Click Element    ${locator_btn-ok}
    Wait Until Page Contains    Welcome to Kru P' Beam!    5s

Input data for email fail
    Input Text    ${locator_Email}    Beam1234gmail.com
    Click Element    ${locator_btnsignup}

Select nationality
    Click Element    ${locator_li_nationality}
    Wait Until Element Is Visible    ${locator_select-nationality}    3s
    Click Element    ${locator_select-nationality}

Select role
    Click Element    ${locator_li_select-role}
    Wait Until Element Is Visible    ${locator_select-role}    3s
    Click Element    ${locator_select-role} 

Select plan
    Click Element    ${locator_li_select-plan}
    Wait Until Element Is Visible    ${locator_select-plan}   3s
    Click Element    ${locator_select-plan}


*** Test Cases ***
TC-001 Page Showing
    Open web browser
    Close Browser

TC-002 Register pass
    Open Web Browser
    Input data for register
    Click Element    ${locator_btnsignup}
    Register Success
    Close Browser

TS-003 Reset data
    Open Web Browser
    Input data for register
    Click Element    ${locator_reset}
    Close Browser

TS-004 Field email fail
    Open Web Browser
    Input data for email fail
    ${txt}    Get Text    ${locator_error_msg_Email} 
    Should Be Equal As Strings    ${txt}    Invalid email address
    Close Browser

TS-007 Require field
    Open Web Browser
    Click Element    ${locator_btnsignup}
    ${txt1}    Get Text    ${locator_error_msg_Firstname}
    Should Be Equal As Strings    ${txt1}    This field is required
    ${txt2}    Get Text    ${locator_error_msg_Lastname}
    Should Be Equal As Strings    ${txt2}    This field is required
    ${txt3}    Get Text    ${locator_error_msg_Email}
    Should Be Equal As Strings    ${txt3}    This field is required
    ${txt4}    Get Text    ${locator_error_msg_Password}
    Should Be Equal As Strings    ${txt4}    This field is required
    ${txt5}    Get Text    ${locator_error_msg_Mobile}
    Should Be Equal As Strings    ${txt5}    This field is required
    ${txt6}    Get Text    ${locator_error_msg_Gender}
    Should Be Equal As Strings    ${txt6}    This field is required
    ${txt7}    Get Text    ${locator_error_msg_Course}
    Should Be Equal As Strings    ${txt7}    This field is required
    ${txt8}    Get Text    ${locator_error_msg_Nationality}
    Should Be Equal As Strings    ${txt8}    This field is required
    ${txt9}    Get Text    ${locator_error_msg_role}
    Should Be Equal As Strings    ${txt9}    This field is required
    ${txt10}    Get Text    ${locator_error_msg_plan}
    Should Be Equal As Strings    ${txt10}    This field is required
    Sleep    3s
    Close Browser
