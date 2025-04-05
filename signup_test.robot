*** Settings ***
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***

# TEST CASES FOR VALID MOBILE NUMBER FIELD
Valid Mobile Number With +63 No Spaces
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_+63_NO_SPACES}
    Then Confirm Mobile Number Page Should Be Displayed

Valid Mobile Number With 09 Prefix
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_09_PREFIX}
    Then Confirm Mobile Number Page Should Be Displayed

Valid Mobile Number With Spaces
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_WITH_SPACES}
    Then Confirm Mobile Number Page Should Be Displayed

Valid Mobile Number With Dashes
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_WITH_DASHES}
    Then Confirm Mobile Number Page Should Be Displayed


# TEST CASES FOR INVALID MOBILE NUMBER FIELD
Invalid Mobile Number Too Short
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number    ${MOBILE_TOO_SHORT}
    Then Registration Error Should Appear


Invalid Mobile Number Too Long
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number   ${MOBILE_TOO_LONG}
    Then Registration Error Should Appear


Invalid Mobile Number With Letters
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number    ${MOBILE_WITH_LETTERS}
    Then Registration Error Should Appear


Invalid Mobile Number With Special Characters
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number    ${MOBILE_WITH_SPECIAL_CHARS}
    Then Registration Error Should Appear


Invalid Mobile Number Without Country Code
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number    ${MOBILE_NO_COUNTRY_CODE}
    Then Registration Error Should Appear


Invalid Mobile Number Starts With 08
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number    ${MOBILE_STARTS_WITH_08}
    Then Registration Error Should Appear


Invalid Mobile Number Empty Input
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Invalid Credentials With Mobile Number    ${EMPTY_INPUT}
    Then Registration Error Should Appear
 

# VALID PASSWORD TEST CASES
Invalid Password With All Lowercase
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_ALL_LOWERCASE}
    Then Password Error Should Be Displayed

Invalid Password With All Uppercase
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_ALL_UPPERCASE}
    Then Password Error Should Be Displayed

Invalid Password With All Numbers
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_ALL_NUMBERS}
    Then Password Error Should Be Displayed

Invalid Password With All Special Characters
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_ALL_SPECIAL_CHARS}
    Then Password Error Should Be Displayed

Invalid Password With Lowercase and Number
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_LOWERCASE_NUMBER}
    Then Password Error Should Be Displayed

Invalid Password With Uppercase and Number
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_UPPERCASE_NUMBER}
    Then Password Error Should Be Displayed

Invalid Password With Uppercase and Special Character
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_UPPERCASE_SPECIAL}
    Then Password Error Should Be Displayed

Valid Password With One of Each
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password    ${PASSWORD_VALID_ONE_OF_EACH}
    Then Password Should Be Accepted
Valid Password Missing Number
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password     ${PASSWORD_MISSING_NUMBER}
    Then Password Should Be Accepted

Invalid Password Missing Special Character
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password     ${PASSWORD_MISSING_SPECIAL}
    Then Password Should Be Accepted

Invalid Password Too Short
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password     ${PASSWORD_TOO_SHORT}
    Then Password Error Should Be Displayed

Invalid Password Blank Input
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Registration With Password     ${PASSWORD_BLANK}
    Then Password Error Should Be Displayed