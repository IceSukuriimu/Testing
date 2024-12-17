*** Settings ***
Library            SeleniumLibrary
Resource           ${CURDIR}/HW3Variable.robot
Resource           ${CURDIR}/HW3Keyword.robot
Suite Setup        Set Selenium Speed    0.2
Test Setup         Open Web Browser
Test Teardown      Close Browser
Suite Teardown     Close All Browsers

*** Test Cases ***

TC-001 Select search/clear filter Test
    [Documentation]    ใช้สำหรับการทดสอบการเลือก Filter และ Clear Filter
    [Tags]    FilterTest
    [Template]    Select Filter
    1    0    0
    0    1    0
    0    0    1
    0    2    3
    3    0    1
    1    3    0
    5    4    1
    0    0    0

TC-002 Add User Test & Check added user 
    [Documentation]    ใช้สำหรับการทดสอบการเพิ่ม User เข้าระบบ และ ตรวจสอบ user ที่แอดเข้าไป
    [Tags]    Add
    Click Element    ${locator_btn-adduser}
    Input data for add user
    Click Element    ${locator_btnsignup}
    Register Success
    Added user recheck

TC-003 Reset data test
    [Documentation]    ใช้สำหรับการทดสอบในกรณีรีเซ็ตข้อมูล
    [Tags]    AddReset
    Click Element    ${locator_btn-adduser}
    Input data for add user
    Execute JavaScript    window.scrollTo(document.body.scrollHeight, 0)
    Click Element    ${locator_reset}
    Sleep    3s

TC-004 Verify Add user fail test
    [Documentation]    ใช้สำหรับการทดสอบในกรณีกรอกข้อมูล add user ไม่ครบถ้วน
    [Tags]    AddFail
    [Setup]    Set first run
    [Template]    Input data fail test template
    ${EMPTY}    อินขาน    Beam1234@gmail.com    1234567890    08222222222    female    1    1    1    1    ${locator_error_msg_Firstname}    This field is required
    กนกนวล    ${EMPTY}    Beam1234@gmail.com    1234567890    08222222222    female    1    1    1    1    ${locator_error_msg_Lastname}    This field is required
    กนกนวล    อินขาน    ${EMPTY}    1234567890    08222222222    female    1    1    1    1    ${locator_error_msg_Email}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    ${EMPTY}      08222222222    female    1    1    1    1    ${locator_error_msg_Password}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    1234567890    ${EMPTY}       female    1    1    1    1    ${locator_error_msg_Mobile}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    1234567890    08222222222        EMP    1    1    1    1    ${locator_error_msg_Gender}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    1234567890    08222222222    female    0    1    1    1    ${locator_error_msg_Course}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    1234567890    08222222222    female    1    0    1    1    ${locator_error_msg_Nationality}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    1234567890    08222222222    female    1    1    0    1    ${locator_error_msg_role}    This field is required
    กนกนวล    อินขาน    Beam1234@gmail.com    1234567890    08222222222    female    1    1    1    0    ${locator_error_msg_plan}    This field is required
    [Teardown]
    

TC-005 Add user page Back button test
    [Documentation]    ใช้สำหรับการทดสอบการกดปุ่ม back ในหน้า add user
    [Tags]    btnback
    Click Element    ${locator_btn-adduser}
    Wait Until Page Contains    Kru P' Beam    5s
    Sleep    2s
    Click Element    ${locator_btn-back}
    wait Until Page Contains    Search Filters    5s
    Sleep    2s

TC-006 Notification display test
    [Documentation]    ใช้สำหรับการทดสอบการกดปุ่มกระดิ่งแจ้งเตือน
    [Tags]    Notify
    Click Element    ${locator_noti_bell}
    Wait Until Element Is Visible    ${locator_noti_expand}    5s
    Sleep    2s

TC-007 Logout Test
    [Documentation]    ใช้สำหรับการทดสอบการ Logout จากระบบ
    [Tags]    Logout
    Click Element    ${locator_Profile_img}
    Wait Until Element Is Visible    ${locator_Logout}    5s
    Click Element    ${locator_Logout}
    Wait Until Page Contains    Welcome to Kru P' Beam!    5s
    Sleep    2s

TC-008 Row per page 
    [Documentation]    ใช้สำหรับการทดสอบการเลือกจำนวนแถว และปุ่มnext/back
    [Tags]    Row
    Click Element    ${locator_btn-search}
    Wait Until Element Is Visible    ${locator_Username}    5s
    Select page row
    Go Next page
    Back Previous page
