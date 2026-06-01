Feature: Medical Center Test Scenarios
  Scenario: Open Medicenter page
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then I should see page title contains "Medicenter"

  Scenario: Open page and verify body is present
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 3 sec
    Then element with xpath "//body" should be present