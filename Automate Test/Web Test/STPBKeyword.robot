*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/STPBVariable.robot

*** Keywords ***
Open Web Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login

Login
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    ${login_email}
    Input Text    ${locator_password}    ${login_password}
    Click Element    ${locator_btnlogin}
    Wait Until Page Contains    Search Filters    5s

Select Role
    [Arguments]    ${Role}
    Click Element    ${locator_search_role}
    IF    ${Role} == 0    
        Click Element    ${locator_search_norole}
    ELSE IF    ${Role} == 1    
        Click Element    ${locator_search_Admin}    
    ELSE IF    ${Role} == 2    
        Click Element    ${locator_search_Author}
    ELSE IF    ${Role} == 3    
        Click Element    ${locator_search_Editor}
    ELSE IF    ${Role} == 4    
        Click Element    ${locator_search_Maintainer}
    ELSE IF    ${Role} == 5    
        Click Element    ${locator_search_Subscriber}
    END
    

Select Plan
    [Arguments]    ${Plan}
    Click Element    ${locator_search_plan}
    IF    ${Plan} == 0    
        Click Element    ${locator_search_noplan}
    ELSE IF    ${Plan} == 1    
        Click Element    ${locator_search_Basic}
    ELSE IF    ${Plan} == 2    
        Click Element    ${locator_search_Company}
    ELSE IF    ${Plan} == 3    
        Click Element    ${locator_search_Enterprise}
    ELSE IF    ${Plan} == 4    
        Click Element    ${locator_search_Team}
    END

Select Status
    [Arguments]    ${Status}
    Click Element    ${locator_search_status}
    IF    ${Status} == 0    
        Click Element    ${locator_search_nostatus}
    ELSE IF    ${Status} == 1    
        Click Element    ${locator_search_Pending}
    ELSE IF    ${Status} == 2    
        Click Element    ${locator_search_Active}
    ELSE IF    ${Status} == 3    
        Click Element    ${locator_search_Inactive}
    END

Select Filter
    [Arguments]    ${Role}    ${Plan}    ${Status}   
    Select Role    ${Role}
    Select Plan    ${Plan}
    Select Status    ${Status}
    Click Element    ${locator_btn-search}
    Wait Until Element Is Visible    ${locator_Username}   5s    
    Click Element    ${locator_btn-clear}

Input data for add user
    Wait Until Page Contains    Kru P' Beam    5s
    Input Text    ${locator_Firstname}    Capybara
    Input Text    ${locator_Lastname}    Kawaii
    Input Text    ${locator_Reg_email}    Cappyzzz@gmail.com
    Input Text    ${locator_Reg_Password}    1234567890
    Input Text    ${Locator_Mobile_Phone}    0845123333
    Select Radio Button    ${locator_Gender}    female
    Select Checkbox    ${locator_chkSQL}
    Select Checkbox    ${locator_chkManual}
    Select Checkbox    ${locator_chkAutomate1}
    Select Checkbox    ${locator_chkAutomate2}
    Select nationality-add
    Select role-add
    Select plan-add
    
Register Success
    Wait Until Page Contains    Register Success    5s
    Click Element    ${locator_btn-ok}
    Wait Until Page Contains    Search Filters    5s

Select nationality-add
    Click Element    ${locator_li_nationality}
    Wait Until Element Is Visible    ${locator_select-nationality}    3s
    Click Element    ${locator_select-nationality}

Select role-add
    Click Element    ${locator_li_select-role}
    Wait Until Element Is Visible    ${locator_select-role}    3s
    Click Element    ${locator_select-role} 

Select plan-add
    Click Element    ${locator_li_select-plan}
    Wait Until Element Is Visible    ${locator_select-plan}   3s
    Click Element    ${locator_select-plan}    

Added user recheck
    Wait Until Page Contains    Search Filters    5s
    Click Element    ${locator_search_role}
    Wait Until Element Is Visible    ${locator_search_Subscriber}    3s
    Click Element    ${locator_search_Subscriber}
    Click Element    ${locator_search_plan}
    Wait Until Element Is Visible    ${locator_search_Team}    3s
    Click Element    ${locator_search_Team}
    Click Element    ${locator_search_status}
    Wait Until Element Is Visible    ${locator_search_Active}    3s
    Click Element    ${locator_search_Active}
    Click Element    ${locator_btn-search}
    Wait Until Element Is Visible    ${locator_Username}   5s

Set first run
    IF    ${First_run}    
        Open Web Browser
        Click Element    ${locator_btn-adduser}
        Wait Until Page Contains    Kru P' Beam    5s
        Set Variable If    ${First_run}    ${False}
    END

Input data fail test template
    [Arguments]    ${Firstname}    ${Lastname}    ${Email}    ${Password}    ${Mobile}    ${Gender}    ${Chkbox}    ${National}    ${Role}    ${Plan}    ${locator}    ${msg}
    Execute JavaScript    window.scrollTo(document.body.scrollHeight, 0)
    Click Element    ${locator_reset}
    Input Text    ${locator_Firstname}    ${Firstname}
    Input Text    ${locator_Lastname}    ${Lastname}
    Input Text    ${locator_regEmail}    ${Email}
    Input Text    ${locator_regPassword}    ${Password}
    Input Text    ${Locator_Mobile_Phone}    ${Mobile}

    IF  "${Gender}" != "EMP"
        Select Radio Button    ${locator_Gender}    ${Gender}
    END

    IF  ${Chkbox} == 1
        Select Checkbox    ${locator_chkSQL}

    ELSE IF  ${Chkbox} == 2
        Select Checkbox    ${locator_chkSQL}
        Select Checkbox    ${locator_chkManual}
    
    ELSE IF  ${Chkbox} == 3
        Select Checkbox    ${locator_chkSQL}
        Select Checkbox    ${locator_chkManual}
        Select Checkbox    ${locator_chkAutomate1}
    
    ELSE IF  ${Chkbox} == 4
        Select Checkbox    ${locator_chkSQL}
        Select Checkbox    ${locator_chkManual}
        Select Checkbox    ${locator_chkAutomate1}
        Select Checkbox    ${locator_chkAutomate2}
    END

    IF  ${National} == 1
        Select nationality-fail
    END
    IF  ${Role} == 1
        Select role-fail
    END
    IF  ${Plan} == 1
        Select plan-fail
    END

    Click Element    ${locator_btnsignup}
    Verify error msg    ${locator}    ${msg}
    Execute JavaScript    window.scrollTo(document.body.scrollHeight, 0)
    Wait Until Element Is Visible    ${locator_reset}    3s
    Sleep    3s

Verify error msg
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}

Select nationality-fail
    Click Element    ${locator_li_nationality}
    Wait Until Element Is Visible    ${locator_select-nationality}    3s
    Click Element    ${locator_select-nationality}

Select role-fail
    Click Element    ${locator_li_select-role}
    Wait Until Element Is Visible    ${locator_select-role}    3s
    Click Element    ${locator_select-role} 

Select plan-fail
    Click Element    ${locator_li_select-plan}
    Wait Until Element Is Visible    ${locator_select-plan}   3s
    Click Element    ${locator_select-plan}

Select row per page
    [Arguments]    ${Rows}
    IF    ${Rows} == 1    
        Click Element    ${locator_10rows}
    ELSE IF    ${Rows} == 2    
        Click Element    ${locator_25rows}    
    ELSE IF    ${Rows} == 3    
        Click Element    ${locator_50rows}
    END

Select page row
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${locator_rowperpage}    5s
    Click Element    ${locator_rowperpage}
    Wait Until Element Is Visible    ${locator_10rows}    5s
    Select row per page    2        # 1=10rows 2=25rows 3=50rows
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Go Next page
    Wait Until Element Is Visible    ${locator_nextpage}    5s
    Click Element    ${locator_nextpage}
    Wait Until Element Is Visible    ${locator_Username}    5s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s

Back Previous page
    Wait Until Element Is Visible    ${locator_prevpage}    5s
    Click Element    ${locator_prevpage}
    Wait Until Element Is Visible    ${locator_Username}    5s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s