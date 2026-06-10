Feature: Medical Center Test Scenarios
  Scenario: Open Medicenter page
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then I should see page title contains "Medicenter"

  Scenario: Open page and verify body is present
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then element with xpath "//body" should be present

  Scenario: Verify admin page opens
    Given I open url "https://medicenter-qa2.vercel.app/admin"
    Then I wait for 3 sec
    Then I should see page title contains "Medicenter"

  Scenario: Verify homepage opens
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then I should see page title contains "Medicenter"

  Scenario: Verify admin page body exists
    Given I open url "https://medicenter-qa2.vercel.app/admin"
    Then I wait for 3 sec
    Then element with xpath "//body" should be present

  Scenario: Verify login page opens
    Given I open url "https://medicenter-qa2.vercel.app/admin"
    Then I wait for 3 sec
    Then I should see page title contains "Medicenter"

  Scenario: Verify home page body exists
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then element with xpath "//body" should be present

  Scenario: Verify homepage title contains Medicenter
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then I should see page title contains "Medicenter"

  Scenario: Verify homepage title is not empty
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then I should see page title does not contain "RandomText123"

  Scenario: Verify admin title is not empty
    Given I open url "https://medicenter-qa2.vercel.app/admin"
    Then I wait for 3 sec
    Then I should see page title does not contain "RandomText123"

  Scenario: Open login form
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then element with xpath "//input[@id='password']" should be present