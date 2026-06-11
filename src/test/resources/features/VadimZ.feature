# author Vadim Z
#  Jira ID B042026-390

Feature: Test Scenarios to test UserStory #6 by Vadim
  Scenario: Login as Patient
      Given I open url "https://medicenter-qa2.vercel.app/"
      When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      And I wait for element with xpath "//a[@href='/contact']" to be present
      And I wait for element with xpath "//h2[text()='Login or create a new account to make an appointment']" to be present
      And I wait for element with xpath "//img" to be present
      And I wait for element with xpath "//button[contains(text(),'Login')]" to be present
      And I wait for element with xpath "//button[contains(text(),'Create account')]" to be present
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      And I wait for 2 sec
      Then I wait for element with xpath "//label[text()='Email address']" to be present
      And I wait for element with xpath "//label[text()='Your Password']" to be present
      And I wait for element with xpath "//a[contains(text(),'Forgot your password')]" to be present
      And I wait for element with xpath "//a[contains(text(),\"Don't have an account\")]" to be present
      Then I type "vadim@example.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[text()='Sign in']"
      And I wait for 2 sec
      Then I wait for element with xpath "//a[contains(text(),'My appointments')]" to be present
      And I wait for element with xpath "//button[contains(text(),'Make an appointment')]" to be present
      And I wait for element with xpath "//button[contains(text(),'Logout')]" to be present
      And I wait for element with xpath "//h2[contains(text(),'Your appointments')]" to be present
  Scenario: Create an appointment as a Patient
      Given I open url "https://medicenter-qa2.vercel.app/"
      When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then I wait for element with xpath "//label[text()='Email address']" to be present
      Then I type "vadim2@example.com" into element with xpath "//input[@id='email']"
      And I type "\"e6249bdb-1c23-4b1b-9993-9a95e4fce952" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[text()='Sign in']"
      Then I wait for element with xpath "//a[contains(text(),'My appointments')]" to be present
      And I click on element with xpath "//button[contains(text(),'Make an appointment')]"
      And I type "QA TESTING" into element with xpath "//textarea[@id='note']"
      Then I click on element with xpath "//select"
      And I wait for 1 sec
      And I click on element with xpath "//option[contains(text(),'Morgan')]"
      And I type "06/30/2026" into element with xpath "//input[@name='date']"
      And I wait for 1 sec
      And I click on element with xpath "//button[contains(.,'07:00')]"
      And I scroll to the element with xpath "//button[contains(text(),'Save')]" with offset 100
      And I click on element with xpath "//button[contains(text(),'Save')]"
      And I wait for 1 sec
      Then element with xpath "//article[.//p[contains(text(),'Morgan Cole')]]" should contain text "qa testing"
  Scenario: Delete an appointment as a Patient
    Given I open url "https://medicenter-qa2.vercel.app/"
    When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//label[text()='Email address']" to be present
    Then I type "vadim2@example.com" into element with xpath "//input[@id='email']"
    And I type "\"e6249bdb-1c23-4b1b-9993-9a95e4fce952" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[text()='Sign in']"
    Then I wait for element with xpath "//a[contains(text(),'My appointments')]" to be present
    And I wait for 1 sec
    And I click on element with xpath "//article[.//p[contains(text(),'Morgan Cole')]]//span[text()='update']"
    And I click on element with xpath "//button[text()='Cancel appointment']"
    And I wait for 1 sec
    Then element with xpath "//article[.//p[contains(text(),'Morgan Cole')]]" should not be present
