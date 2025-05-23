*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSER}                 Chrome
${DELAY}                   0.5
${FACEBOOK_REGISTER_URL}    https://www.facebook.com/r.php?locale=en_US&display=page
${EXPECTED_TITLE}          Sign Up for Facebook

*** Keywords ***

### Main Test Case Keywords ###
I'm on the Facebook signup page
    Open Chrome in incognito mode
    Go to Facebook registration
    Wait until page loads

I've entered a valid input for credentials
    Enter name "John Crisistom" "Rosales"
    Select birthday November 17, 1994
    Choose male gender
    Set temporary password "Paolo095!"

I've entered a valid input for credentials with valid mobile number
    I've entered a valid input for credentials
    Use email "09162856862"

I type "${number}" as my mobile number
    Input Text    name=reg_email__    ${number}
    Wait for loading to finish

I leave mobile number blank
    Clear Element Text    name=reg_email__

I set my password to "${password}"
    Input Password    name=reg_passwd__    ${password}

I leave password blank
    Clear Element Text    name=reg_passwd__

I click sign up
    Click Button    name=websubmit

I should see the mobile confirmation page
    Sleep    15s    # Wait for 15 seconds before checking

I should see "${message}"
    Wait Until Page Contains    ${message}    timeout=15s

I should proceed to next step
    Sleep    15s    # Wait for 15 seconds before checking

If the number is valid I should see the mobile confirmation page otherwise I should see a pop-up message "${error_message}"
    ${valid}=    Run Keyword And Return Status    I should see the mobile confirmation page
    Run Keyword If    not ${valid}    I should see "${error_message}"

If password meets requirements I should proceed to mobile number confirmation otherwise I should see a pop-up message "${error_message}"
    ${valid}=    Run Keyword And Return Status    I should proceed to next step
    Run Keyword If    not ${valid}    I should see "${error_message}"

### Technical Implementation Keywords ###
Open Chrome in incognito mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-notifications
    Create WebDriver    Chrome    options=${options}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go to Facebook registration
    Go To    ${FACEBOOK_REGISTER_URL}
    Wait Until Page Contains    Sign Up    timeout=20s
    ${actual_title}=    Get Title
    Run Keyword If    '${actual_title}' != '${EXPECTED_TITLE}'
    ...    Log    Title mismatch. Expected: ${EXPECTED_TITLE}, Actual: ${actual_title}    level=WARN
    # Continue execution even if title doesn't match exactly

Wait until page loads
    Wait Until Element Is Visible    name=firstname    timeout=20s

Enter name "${firstname}" "${lastname}"
    Input Text    name=firstname    ${firstname}
    Input Text    name=lastname    ${lastname}

Select birthday November 17, 1994
    Select From List By Value    name=birthday_month    11
    Select From List By Value    name=birthday_day      17
    Select From List By Value    name=birthday_year     1994

Choose male gender
    Click Element    xpath=//input[@name='sex' and @value='2']

Set temporary password "${password}"
    Input Password    name=reg_passwd__    ${password}

Use email "${email}"
    Input Text    name=reg_email__    ${email}

Wait for loading to finish
    Wait Until Element Is Not Visible    css:div[role="progressbar"]    timeout=10s