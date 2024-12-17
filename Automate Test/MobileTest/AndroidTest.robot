*** Settings ***
Library    AppiumLibrary


*** Variables ***
${Remote_URL}           http://localhost:4723/wd/hub
${PlatformName}         Android
${PlatformVersion}      12.0
${DeviceName}           emulator-5554
${AppPackage}           com.android.settings
${AppActivity}          com.android.settings.Settings
${Search_Bar}           id=com.android.settings:id/search_action_bar
${Search_box}           id=com.google.android.settings.intelligence:id/open_search_view_edit_text
${locator_network}      xpath=//android.support.v7.widget.RecyclerView[@resource-id="com.google.android.settings.intelligence:id/list_results"]/android.widget.LinearLayout[2]/android.widget.LinearLayout
${locator_airplane}     id=android:id/switch_widget
${locator_btnBack}      xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
${locator_search_back}  xpath=//android.widget.ImageButton[@content-desc="Back"]



*** Keywords ***
Open App
    Open Application    ${Remote_URL}    
    ...    platformName=${PlatformName}    
    ...    platformVersion=${PlatformVersion}    
    ...    deviceName=${DeviceName}
    ...    automationName=UiAutomator2
    ...    newCommandTimeout=2500
    ...    appPackage=${AppPackage}
    ...    appActivity=${AppActivity}

*** Test Cases ***
Test Script
    Open App
    Click Element    ${Search_Bar}
    Wait Until Element Is Visible    ${Search_box}
    Click Element    ${Search_box}
    Input Text       ${Search_box}    network
    Click Element       ${locator_network}
    Wait Until Element Is Visible    ${locator_airplane}
    Click Element    ${locator_airplane}
    Click Element    ${locator_btnBack}
    Click Element    ${locator_search_back}
    Close Application