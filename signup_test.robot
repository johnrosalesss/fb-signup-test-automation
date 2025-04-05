*** Settings ***
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***

# TEST CASES FOR MOBILE NUMBER FIELD
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
 