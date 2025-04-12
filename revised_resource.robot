*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                 Chrome
${DELAY}                   0.5
${FACEBOOK_REGISTER_URL}    https://www.facebook.com/r.php?locale=en_US&display=page

*** Keywords ***
The user opens Chrome browser in incognito mode
    [Documentation]    Opens a new Chrome browser window in incognito mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

The user navigates to Facebook registration page
    [Documentation]    Navigates to Facebook's registration page
    Go To    ${FACEBOOK_REGISTER_URL}
    Wait Until Page Contains    Sign Up    timeout=10s
    Title Should Be    Sign Up for Facebook

The user enters a valid first name "John Crisistom"
    [Documentation]    Enters first name in the registration form
    Input Text    name=firstname    John Crisistom

The user enters a valid last name "Rosales"
    [Documentation]    Enters last name in the registration form
    Input Text    name=lastname    Rosales

The user selects birthdate November 17, 1994
    [Documentation]    Selects birthdate in the registration form
    Select From List By Value    name=birthday_month    11
    Select From List By Value    name=birthday_day      17
    Select From List By Value    name=birthday_year     1994

The user selects male gender
    [Documentation]    Selects male gender option
    Click Element    xpath=//input[@name='sex' and @value='2']

The user enters mobile number "+639162856862"
    Input Text    name=reg_email__    +639162856862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "09162856862"
    Input Text    name=reg_email__    09162856862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number with spaces "+63 916 285 6862"
    Input Text    name=reg_email__    +63 916 285 6862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "+63-916-285-6862"
    Input Text    name=reg_email__    +63-916-285-6862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "0916285"
    Input Text    name=reg_email__    0916285
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "091628568621234"
    Input Text    name=reg_email__    091628568621234
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "09AB2856862"
    Input Text    name=reg_email__    09AB2856862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "0916-!@#-6862"
    Input Text    name=reg_email__    0916-!@#-6862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "9162856862"
    Input Text    name=reg_email__    9162856862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user enters mobile number "08162856862"
    Input Text    name=reg_email__    08162856862
    Sleep    2s
    Wait Until Element Is Not Visible    css=div[role="progressbar"]    timeout=5s

The user leaves mobile number field empty
    [Documentation]    Leaves the mobile number field empty
    Clear Element Text    name=reg_email__

The user enters a valid email "natsuxlucy02@gmail.com"
    [Documentation]    Enters email in registration form
    Input Text    name=reg_email__    natsuxlucy02@gmail.com

The user enters password "Paolo095!"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    Paolo095!

The user enters password "abcdef"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    abcdef

The user enters password "GHIJKL"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    GHIJKL

The user enters password "123456"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    123456

The user enters password "aB1@34"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    aB1@34

The user enters password "!@#$%^"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    !@#$%^

The user enters password "abc123"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    abc123

The user enters password "DEF123"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    DEF123

The user enters password "ABC@#"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    ABC@#

The user enters password "Abcdef!"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    Abcdef!

The user enters password "HIJ123"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    HIJ123

The user enters password "aB1@"
    [Documentation]    Enters password in registration form
    Input Password    name=reg_passwd__    aB1@

The user leaves password field empty
    [Documentation]    Leaves the password field empty
    Clear Element Text    name=reg_passwd__

The user clicks the submit button
    [Documentation]    Clicks the registration submit button
    Click Button    name=websubmit

The system should show the mobile number confirmation page
    [Documentation]    Verifies mobile confirmation page appears
    Wait Until Element Is Visible    css=div._5dbb    timeout=15s

The system should not show any mobile number format errors
    [Documentation]    Verifies no mobile number errors appear
    Page Should Not Contain    Please enter a valid mobile number

The system should show a mobile number format error message
    [Documentation]    Verifies mobile number error appears
    Wait Until Element Is Visible    css=div._5dbb    timeout=15s
    Page Should Contain    Please enter a valid mobile number

The system should not proceed to confirmation page
    [Documentation]    Verifies registration didn't proceed
    Page Should Not Contain    Confirm your phone number

The system should show a password complexity error message
    [Documentation]    Verifies password error appears
    Wait Until Element Is Visible    css=div._5dbb    timeout=15s
    Page Should Contain    Choose a more secure password

The system should not accept the password
    [Documentation]    Verifies password was rejected
    Page Should Not Contain    Confirm your phone number

The system should accept the password
    [Documentation]    Verifies password was accepted
    Wait Until Element Is Visible    css=div._5dbb    timeout=15s
    Page Should Not Contain    Choose a more secure password

The system should show a password length error message
    [Documentation]    Verifies password length error appears
    Wait Until Element Is Visible    css=div._5dbb    timeout=15s
    Page Should Contain    Password must be at least 6 characters

The system should show a required field error message
    [Documentation]    Verifies required field error appears
    Wait Until Element Is Visible    css=div._5dbb    timeout=15s
    Page Should Contain    Please enter a valid password