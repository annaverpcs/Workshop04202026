#author: Abdullah
#Selenium Webdriver practice
@Medicenter
Feature: Selenium Webdriver practice
  Scenario: Login
    Given AbdullahN launch "Medicenter V2 URL"
    Then AbdullahN page title is "Medicenter"
    And AbdullahN wait for "//h1[contains(text(),'Medical Center')]" text
    Then AbdullahN click on "Login" button
    And AbdullahN wait for "//a[contains(text(),'Back to home')]" text
    Then AbdullahN wait for "//label[normalize-space()='Email address']" text
    And AbdullahN type "patient2@gmail.com" to "Email" textField
    And AbdullahN type "abc123" to "Password" textField
    And AbdullahN click on "Sign In" button
    Then I should see page title contains "Medicenter"
    Then I wait for 3 sec
@Medicenter @smoke
  Scenario Outline: Login
    Given AbdullahN launch "Medicenter V2 URL"
    Then AbdullahN page title is "Medicenter"
    And AbdullahN wait for "//h1[contains(text(),'Medical Center')]" text
    Then AbdullahN click on "Login" button
    And AbdullahN wait for "//a[contains(text(),'Back to home')]" text
    Then AbdullahN wait for "//label[normalize-space()='Email address']" text
    And AbdullahN type <sEmail> to "Email" textField
    And AbdullahN type <sPassword> to "Password" textField
    And AbdullahN click on "Sign In" button
    Then I should see page title contains <pageTitle>
    Then I wait for <sec> sec

    Examples: Valid Scenarios
      | sEmail                      | sPassword   | pageTitle    | sec |
      | "patient2@gmail.com"        | "abc123"    | "Medicenter" | 1   |
      | "administrator1@gmail.com"  | "abc123"    | "Medicenter" | 1   |
      | "administrator2@gmail.com"  | "abc123"    | "Medicenter" | 1   |
    Example: Invalid Scenarios
      | ""                          | ""                    | "Medicenter" | 1   |
      | "administrator2@gmail.com"  | "invalid password"    | "Medicenter" | 1   |


