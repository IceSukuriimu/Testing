*** Variables ***
${url}    https://automate-test.stpb-digital.com/login/
${browser}    chrome
${login_email}    user.test@krupbeam.com
${login_password}    123456789

#Locator Login
${locator_email}    id=email
${locator_password}    name=password
${locator_btnlogin}    id=btn-login
${locator_msg_email}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_password}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_hyperlink_register}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a
${First_run}    ${True}

#locator Register
${locator_Firstname}    id=firstname
${locator_error_msg_Firstname}    id=error-firstname
${locator_Lastname}    id=lastname
${locator_error_msg_Lastname}    id=error-lastname
${locator_Reg_email}    id=email
${locator_error_msg_Email}    id=error-email
${locator_Reg_Password}    id=password
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
${locator_select-role}    xpath=//*[@id="menu-"]/div[3]/ul/li[5]
${locator_error_msg_role}    id=validation-role
${locator_li_select-plan}    id=select-plan
${locator_select-plan}    xpath=//*[@id="menu-"]/div[3]/ul/li[4]
${locator_error_msg_plan}    id=validation-plan
${locator_btnsignup}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button
${locator_reset}    id=reset
${locator_btn-ok}    id=btn-ok
${locator_btn-back}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
${locator_rowperpage}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]
${locator_10rows}    xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_25rows}    xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_50rows}    xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_nextpage}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]
${locator_prevpage}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[1]
#Locator Search
${locator_Profile_img}    xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_Logout}    css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li
${locator_noti_bell}    xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_noti_expand}    xpath=/html/body/div[3]/div[3]/ul/li[1]/div/p
${locator_search_role}    id=select-role
${locator_search_plan}    id=select-plan
${locator_search_status}    id=select-status
${locator_btn-clear}    id=btn-clear
${locator_btn-search}    id=btn-search
${locator_btn-adduser}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a
${locator_Username}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[1]/div/div[2]/a[1]
#role
${locator_search_norole}    id=option-select-role-0
${locator_search_Admin}    id=option-select-role-1
${locator_search_Author}    id=option-select-role-2
${locator_search_Editor}    id=option-select-role-3
${locator_search_Maintainer}    id=option-select-role-4
${locator_search_Subscriber}    id=option-select-role-5
#plan
${locator_search_noplan}    id=option-select-plan-0
${locator_search_Basic}    id=option-select-plan-1
${locator_search_Company}    id=option-select-plan-2
${locator_search_Enterprise}    id=option-select-plan-3
${locator_search_Team}    id=option-select-plan-4
#status
${locator_search_nostatus}    id=option-select-status-0
${locator_search_Pending}    id=option-select-status-1
${locator_search_Active}    id=option-select-status-2
${locator_search_Inactive}    id=option-select-status-3