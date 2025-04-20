*** Settings ***
Resource          revised_resource.robot
Test Teardown     Close Browser

*** Test Cases ***

# TEST CASES FOR VALID MOBILE NUMBER FIELD
Valid Mobile Number With +63 And No Spaces
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "+639162856862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show the mobile number confirmation page
    And The system should not show any mobile number format errors

Valid Mobile Number With 09 Prefix
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales" 
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "09162856862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show the mobile number confirmation page
    And The system should not show any mobile number format errors

Valid Mobile Number With Spaces
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number with spaces "+63 916 285 6862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show the mobile number confirmation page
    And The system should not show any mobile number format errors

Valid Mobile Number With Dashes
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "+63-916-285-6862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show the mobile number confirmation page
    And The system should not show any mobile number format errors

Valid Mobile Number Without Country Code
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "9162856862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show the mobile number confirmation page
    And The system should not show any mobile number format errors

# TEST CASES FOR INVALID MOBILE NUMBER FIELD
Invalid Mobile Number With Only 4 Digits (Too Short)
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "0916"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show a mobile number format error message
    And The system should not proceed to confirmation page

Invalid Mobile Number With 15 Digits (Too Long)
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "091628568621234"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show a mobile number format error message
    And The system should not proceed to confirmation page

Invalid Mobile Number With Letters
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "09AB2856862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show a mobile number format error message
    And The system should not proceed to confirmation page

Invalid Mobile Number With Special Characters
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "0916-!@#-6862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show a mobile number format error message
    And The system should not proceed to confirmation page

Invalid Mobile Number Starting With 08
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters mobile number "08162856862"
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show a mobile number format error message
    And The system should not proceed to confirmation page

Invalid Mobile Number With Empty Input
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user leaves mobile number field empty
    And The user enters password "Paolo095!"
    And The user clicks the submit button
    Then The system should show a mobile number format error message
    And The system should not proceed to confirmation page


# TEST CASES FOR INVALID PASSWORD FIELD
Invalid Password With All Lowercase Letters
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "abcdef"
    And The user clicks the submit button
    Then The system should show a password complexity error message
    And The system should not accept the password

Invalid Password With All Numbers
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "123456"
    And The user clicks the submit button
    Then The system should show a password complexity error message
    And The system should not accept the password

Invalid Password With Lowercase Letters And Numbers Only
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "abc123"
    And The user clicks the submit button
    Then The system should show a password complexity error message
    And The system should not accept the password
    

Invalid Password With Only 4 Characters (Too Short)
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "aB1@"
    And The user clicks the submit button
    Then The system should not accept the password

Invalid Password With Blank Input
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user leaves password field empty
    And The user clicks the submit button
    Then The system should not accept the password

# TEST CASES FOR VALID PASSWORD FIELD
Valid Password With Lowercase, Uppercase, Number and Special Character
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "aB1@34"
    And The user clicks the submit button
    Then The system should accept the password
    
Valid Password With All Uppercase Letters
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "GHIJKL"
    And The user clicks the submit button
    Then The system should accept the password

Valid Password Containing Only Special Characters
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "!@#$%^"
    And The user clicks the submit button
    Then The system should accept the password

Valid Password With Uppercase Letters And Numbers Only
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "DEF123"
    And The user clicks the submit button
    Then The system should accept the password

Valid Password With Uppercase Letters And Special Characters Only
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "ABC@#?"
    And The user clicks the submit button
    Then The system should accept the password

Valid Password Missing Numbers But Has Other Types
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "Abcdef!"
    And The user clicks the submit button
    Then The system should accept the password


Valid Password Missing Special Characters But Has Other Types
    Given The user opens Chrome browser in incognito mode
    And The user navigates to Facebook registration page
    When The user enters a valid first name "John Crisistom"
    And The user enters a valid last name "Rosales"
    And The user selects birthdate November 17, 1994
    And The user selects male gender
    And The user enters a valid email "natsuxlucy02@gmail.com"
    And The user enters password "HIJ123"
    And The user clicks the submit button
    Then The system should accept the password