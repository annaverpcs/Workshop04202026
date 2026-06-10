# author: Yulia Klyuzova
# Medical Center Scenarios
@medicenter
Feature:  MediCenter Test Scenarios

  # Scenario
    #  Given - initial state
    #  When - user action, "I click a button"
    #  Then - expected outcome, "I should see XYZ"

  # Login as administrator
  Background:
    Given I open url "https://medicenter-qa2.vercel.app/"
    When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And element with xpath "//label[normalize-space()='Email address']" should be present
    Then I clear element with xpath "//input[@id='email']"
    And I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//h1[contains(text(), 'Mary Poppins')]" to be present
    And I wait for 3 sec

  Scenario: create appointment as admin

    When I wait for element with xpath "//*[@id='radix-:r6:-trigger-appointments']" to be present
    Then I click on element with xpath "//*[@id='radix-:r6:-trigger-appointments']"
    And I wait for 3 sec

    # click on 'Add appointment button
    When I wait for element with xpath "//*[@id='radix-:r6:-content-appointments']/button" to be present
    Then I click on element with xpath "//*[@id='radix-:r6:-content-appointments']/button"

    # enter appt data into window
    When I wait for element with xpath '//*[@id="user_name"]' to be present
    Then I type "Glenn Raindrop" into element with xpath '//*[@id="user_name"]'
    And I type "Annual checkup" into element with xpath '//*[@id="note"]'
    And I wait for 2 sec

    # pick a specialist from dropdown
    # @When("I select {string} from the {string} dropdown")
    When I select "Alexander N. Bakulev (Doctor)" from the "employee_id" dropdown
    And I wait for 2 sec

    # pick a date and time
    And I type "06/17/2026" into element with xpath "//input[@id='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[contains(text(),'09:30 AM')]"
    And I wait for 2 sec

    # click Submit
    When I click on element with xpath "//button[@type='submit']"

    # Confirm the window closed
    Then element with xpath '//*[@id="radix-:r99:"]' should not be present
    And I wait for 3 sec

    # Confirm the appt was created for the date selected
    And element with text 'Glenn Raindrop' should be present

    # Open Appt summary
    When I click on element with text 'Glenn Raindrop'
    And I wait for 3 sec

    # Cancel appt
    When I click on element with text 'Cancel appointment'
    And I wait for 1 sec
    Then element with xpath '//*[@id="radix-:r99:"]' should not be present
    And element with text 'Glenn Raindrop' should not be present
    And I wait for 5 sec


