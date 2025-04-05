*** Settings ***
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***

# TEST CASES FOR MOBILE NUMBER FIELD
Valid Mobile Number With +63 No Spaces
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_+63_NO_SPACES}
    Then Confirm Email Page Should Be Displayed

Valid Mobile Number With 09 Prefix
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_09_PREFIX}
    Then Confirm Email Page Should Be Displayed

Valid Mobile Number With Spaces
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_WITH_SPACES}
    Then Confirm Email Page Should Be Displayed

Valid Mobile Number With Dashes
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_WITH_DASHES}
    Then Confirm Email Page Should Be Displayed

Invalid Mobile Number Too Short
    Given Browser Is Opened To Facebook Registration Page
    When User Enters Valid Credentials With Mobile Number    ${MOBILE_TOO_SHORT}
    Then Registration Error Should Appear
    And Error Icon Should Be Displayed
    And Input Border Should Show Error Color

# TEST CASES FOR PASSWORD FIELD
    