# author: OlgaB

  Feature: User Story 4. Admin can edit specialist's information

    Background: #admin login
      Given I open url "https://medicenter-qa2.vercel.app/"
      When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      And element with xpath "//label[@for='email']" should be present
      Then I clear element with xpath "//input[@id='email']"
      And I type "administrator2@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present

    Scenario: Login as an administrator and create the specialist

      #create new specialist
      Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present
      And I wait for 1 sec
      When I click on element with xpath "//button[text()='Add specialist']"
      Then I wait for element with xpath "//div[@role='dialog']//span[text()='New specialist']" to be present
      And I type "Alex" into element with xpath "//input[@id='first_name']"
      And I type "Johnson" into element with xpath "//input[@id='last_name']"
      And I click on element with xpath "//option[@value='cardiologist']"
      And I wait for element with xpath "//fieldset[@id='workingDays']" to be present

      And I click on element with xpath "//input[@name='working_hours.monday.from'][@value]"
      And I type "09:00" into element with xpath "//input[@name='working_hours.monday.from']"
      And I wait for 1 sec
      And I click on element with xpath "//input[@id='working_hours.monday.to']"
      And I type "19:00" into element with xpath "//input[@name='working_hours.monday.to']"
      And I wait for 2 sec
      And I click on element with xpath "//input[@name='working_hours.tuesday.from'][@value]"
      And I type "10:00" into element with xpath "//input[@name='working_hours.tuesday.from']"
      And I wait for 1 sec
      And I click on element with xpath "//input[@id='working_hours.tuesday.to']"
      And I type "20:00" into element with xpath "//input[@name='working_hours.tuesday.to']"
      And I wait for 2 sec
      Then I wait for element with xpath "//button[text()='Save']" to be present
      And I click on element with xpath "//button[text()='Save']"
      And I wait for 2 sec
      Then I wait for element with xpath "//div[@role='dialog']//span[text()='New specialist']" to not be present
      And I wait for 1 sec
      Then I reload the page
      And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present

      #Editing the Specialist
      And I wait for element with xpath "//td[text()='Alex Johnson']" to be present
      And I click on element with xpath "//td[text()='Alex Johnson']/ancestor::tr/td[3]/div//label[text()='Edit']/ancestor::span"
      Then I wait for element with xpath "//div[@role='dialog']//span[text()='Edit specialist info']" to be present
      And I wait for element with xpath "//input[@id='first_name']" to be present
      And I wait for 2 sec
      And I type "andra" into element with xpath "//input[@id='first_name']"
      And I type "-Johnson" into element with xpath "//input[@id='last_name']"
      And I click on element with xpath "//option[@value='nurse']"
      And I wait for element with xpath "//fieldset[@id='workingDays']" to be present
      And I clear element with xpath "//input[@name='working_hours.monday.from'][@value]"
      And I wait for 1 sec
      And I type "10:00" into element with xpath "//input[@name='working_hours.monday.from']"
      And I wait for 1 sec
      And I click on element with xpath "//input[@id='working_hours.monday.to']"
      And I clear element with xpath "//input[@name='working_hours.monday.to'][@value]"
      And I wait for 2 sec
      And I type "18:00" into element with xpath "//input[@name='working_hours.monday.to']"
      And I wait for 2 sec
      And I click on element with xpath "//button[text()='Save']"
      Then I wait for element with xpath "//div[@role='dialog']//span[text()='Edit specialist info']" to not be present
      #verifying specialist info was changed
      And I wait for 2 sec
      Then I reload the page
      And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      And I wait for element with xpath "//td[text()='Alexandra Johnson-Johnson']" to be present
      And I wait for element with xpath "//td[text()='Alexandra Johnson-Johnson']/ancestor::tr/td[2]//span[text()='Nurse']" to be present
      And I click on element with xpath "//td[text()='Alexandra Johnson-Johnson']/ancestor::tr/td[3]/div//label[text()='Edit']/ancestor::span"
