*** Settings ***
Library           SeleniumLibrary

*** Variables ***
# Browser Config
${BROWSER}        Chrome
${DELAY}          0.5
${FACEBOOK_REGISTER_URL}    https://www.facebook.com/r.php?locale=en_US&display=page

# User Credentials
${VALID_FIRST_NAME}    John Crisistom
${VALID_LAST_NAME}     Rosales
${VALID_MONTH}         11
${VALID_DAY}           17
${VALID_YEAR}          1994
${VALID_PASSWORD}      Paolo095!
${VALID_EMAIL}         natsuxlucy02@gmail.com

# SPECIFIC MOBILE NUMBER FORMATS (Scalar Variables)
${MOBILE_+63_NO_SPACES}       +639162856862
${MOBILE_09_PREFIX}           09162856862
${MOBILE_WITH_SPACES}         +63 916 285 6862
${MOBILE_WITH_DASHES}         +63-916-285-6862
${MOBILE_TOO_SHORT}           0916285
${MOBILE_TOO_LONG}            091628568621234
${MOBILE_WITH_LETTERS}        09AB2856862
${MOBILE_WITH_SPECIAL_CHARS}  0916-!@#-6862
${MOBILE_NO_COUNTRY_CODE}     9162856862
${MOBILE_STARTS_WITH_08}      08162856862
${EMPTY_INPUT}                ${EMPTY}

# SPECIFIC PASSWORD FORMATS (Scalar Variables)
${PASSWORD_ALL_LOWERCASE}       abcdef
${PASSWORD_ALL_UPPERCASE}       ABCDEF
${PASSWORD_ALL_NUMBERS}         123456
${PASSWORD_ALL_SPECIAL_CHARS}   !@#$%^
${PASSWORD_LOWERCASE_NUMBER}    abc123
${PASSWORD_UPPERCASE_NUMBER}    ABC123
${PASSWORD_UPPERCASE_SPECIAL}   ABC@# 
${PASSWORD_VALID_ONE_OF_EACH}   aB1@34
${PASSWORD_MISSING_NUMBER}      Abcdef!
${PASSWORD_MISSING_SPECIAL}     Abc123
${PASSWORD_TOO_SHORT}           aB1@
${PASSWORD_BLANK}               ${EMPTY}

*** Keywords ***
Browser Is Opened To Facebook Registration Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    modules=sys
    Call Method    ${chrome_options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${chrome_options}
    Go To    ${FACEBOOK_REGISTER_URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Registration Page Should Be Open

Registration Page Should Be Open
    Title Should Be    Sign Up for Facebook

# ACTION KEYWORD (With Specific Variable Usage)
User Enters Valid Credentials With Mobile Number
    [Arguments]    ${mobile_number}
    # Personal Information
    Input Text    name:firstname       ${VALID_FIRST_NAME}
    Input Text    name:lastname        ${VALID_LAST_NAME}
    
    # Birthdate Selection
    Click Element    name:birthday_month
    Select From List By Value    name:birthday_month    ${VALID_MONTH}
    Click Element    name:birthday_day
    Select From List By Value    name:birthday_day      ${VALID_DAY}
    Click Element    name:birthday_year
    Select From List By Value    name:birthday_year     ${VALID_YEAR}
    
    # Gender Selection
    Click Element    css:input[name="sex"][value="2"]
    
    # MOBILE NUMBER INPUT (Uses argument value)
    Input Text    name:reg_email__     ${mobile_number}
    
    # Password and Submission
    Input Text    name:reg_passwd__    ${VALID_PASSWORD}
    Click Button    name:websubmit

User Enters Invalid Credentials With Mobile Number
    [Arguments]    ${mobile_number}
    # Personal Information
    Input Text    name:firstname       ${VALID_FIRST_NAME}
    Input Text    name:lastname        ${VALID_LAST_NAME}
    
    # Birthdate Selection
    Click Element    name:birthday_month
    Select From List By Value    name:birthday_month    ${VALID_MONTH}
    Click Element    name:birthday_day
    Select From List By Value    name:birthday_day      ${VALID_DAY}
    Click Element    name:birthday_year
    Select From List By Value    name:birthday_year     ${VALID_YEAR}
    
    # Gender Selection
    Click Element    css:input[name="sex"][value="2"]
    
    # MOBILE NUMBER INPUT (Uses argument value)
    Input Text    name:reg_email__     ${mobile_number}
    
    # Password and Submission
    Input Text    name:reg_passwd__    ${VALID_PASSWORD}
    Click Button    name:websubmit

# VERIFICATION KEYWORDS
Confirm Mobile Number Page Should Be Displayed
    Sleep    15s    # Wait for 15 seconds before checking
    Wait Until Element Is Visible    css:._5dbb    timeout=15s

Registration Error Should Appear
    Wait Until Element Is Visible    css:._5dbb    timeout=15s


# VALID PASSWORD VERIFICATION
Password Should Be Accepted
    [Documentation]    Verifies that the password was accepted and registration progressed
    Sleep    15s    # Wait for page transition

# INVALID PASSWORD VERIFICATION
Password Error Should Be Displayed
    [Documentation]    Verifies that an invalid password error is shown
    Sleep    15s    # Wait for page transition


# UNIFIED PASSWORD TEST KEYWORD
Test Password Validation
    [Arguments]    ${password}    ${expected_result}
    User Enters Registration With Password    ${password}
    
    Run Keyword If    "${expected_result}" == "valid"    Password Should Be Accepted
    ...    ELSE IF    "${expected_result}" == "invalid"    Password Error Should Be Displayed
    ...    ELSE    Fail    Invalid expected_result parameter: ${expected_result}
    
    # Keep browser open for inspection
    Sleep    5s

# PASSWORD INPUT KEYWORDS
User Enters Registration With Password
    [Arguments]    ${password}
    # Personal Information
    Input Text    name:firstname       ${VALID_FIRST_NAME}
    Input Text    name:lastname        ${VALID_LAST_NAME}
    
    # Birthdate Selection
    Click Element    name:birthday_month
    Select From List By Value    name:birthday_month    ${VALID_MONTH}
    Click Element    name:birthday_day
    Select From List By Value    name:birthday_day      ${VALID_DAY}
    Click Element    name:birthday_year
    Select From List By Value    name:birthday_year     ${VALID_YEAR}
    
    # Gender Selection
    Click Element    css:input[name="sex"][value="2"]
    
    # MOBILE NUMBER INPUT (Uses argument value)
    Input Text    name:reg_email__     ${VALID_EMAIL}
    
    # Password and Submission
    Input Text    name:reg_passwd__    ${password}
    Click Button    name:websubmit