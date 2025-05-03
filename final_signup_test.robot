*** Settings ***
Resource          final_resource.robot
Test Teardown     Close Browser

*** Test Cases ***

### Mobile Number Validation Tests ###

When signing up for a new Facebook account using a proper Philippine mobile number that includes the +63 country code
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "+639162856862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a standard Philippine mobile number that starts with 09 prefix
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "09162856862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a Philippine mobile number that contains spaces between digit groups
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "+63 916 285 6862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a Philippine mobile number formatted with dashes between digit groups
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "+63-916-285-6862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a 10-digit Philippine mobile number without any country code
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "9162856862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account while only providing the first 4 digits of a Philippine mobile number
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "0916" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using an unusually long 15-digit mobile number
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "091628568621234" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a mobile number that contains alphabetical letters mixed with digits
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "09AB2856862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a mobile number that contains special characters like !@#
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "0916-!@#-6862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page

When signing up for a new Facebook account using a mobile number that starts with invalid 08 prefix
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I type "08162856862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page
        
When signing up for a new Facebook account without providing any mobile number in the required field
    Given I'm on the Facebook signup page
    And I've entered my basic information
    When I leave mobile number blank
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page


### Password Validation Tests ###

    Given I'm on the Facebook signup page
    And I've entered my basic information with email
    When I set my password to "abcdef"
    And I click sign up
    Then If password meets requirements I should proceed to next step

When signing up for a new Facebook account using a password that contains only numbers
    Given I'm on the Facebook signup page
    And I've entered my basic information with email
    When I set my password to "123456"
    And I click sign up
    Then If password meets requirements I should proceed to next step

When signing up for a new Facebook account using a simple password that combines letters and numbers
    Given I'm on the Facebook signup page
    And I've entered my basic information with email
    When I set my password to "abc123"
    And I click sign up
    Then If password meets requirements I should proceed to next step


When signing up for a new Facebook account using a password that's only 4 characters long
    Given I'm on the Facebook signup page
    And I've entered my basic information with email
    When I set my password to "aB1@"
    And I click sign up
    Then If password meets requirements I should proceed to next step

When signing up for a new Facebook account without entering any password in the required field
    Given I'm on the Facebook signup page
    And I've entered my basic information with email
    When I leave password blank
    And I click sign up
    Then If password meets requirements I should proceed to next step

When signing up for a new Facebook account using a strong password that combines uppercase, lowercase, numbers and symbols
    Given I'm on the Facebook signup page
    And I've entered my basic information with email
    When I set my password to "Paolo095!"
    And I click sign up
    Then If password meets requirements I should proceed to next step