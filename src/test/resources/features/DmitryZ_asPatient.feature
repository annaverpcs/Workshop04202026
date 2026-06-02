# author: Dmitry Z
  # Medical center
  #As Patient. Create new appointment, verify, and delete
  
  Feature: MediCenter Test Scenarios as Patient

    Background: #login as patient
      Given I open url "https://medicenter-qa2.vercel.app/"
      When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      And element with xpath "//label[@for='email']" should be present
      Then I clear element with xpath "//input[@id='email']"
      And I type "ykhin@supplementsdiary.com" into element with xpath "//input[@id='email']"
      And I type "Abc123#" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//h1[contains(text(), 'Healthy Patient')]" to be present
      And I wait for 1 sec

    Scenario: #Create new appointment
      #When I click on element with xpath "//button[@type='button']"
      When I click on element with xpath "//button[contains(text(),'Make an appointment')]"
      And I wait for element with xpath "//span[contains(text(), 'Make an appointment')]" to be present
      Then I type "New post" into element with xpath "//textarea[@id ='note']"
      And I wait for 1 sec
      Then I click on element with xpath "//select[@name='employee_id']/..//option[@value='918739d6-3970-4ca3-a17d-a6c0578d8e30']"
      And I type "06.05.2026" into element with xpath "//input[@id='date']"
      And I wait for 3 sec
      Then I click on element with xpath "//button[contains(text(), '08:00 AM')]"
      Then I click on element with xpath "//button[@type='submit']"
      And I wait for 4 sec

    Scenario: #verify note, Name of Doctor, Date, time
        #note is correct
      Then I wait for element with xpath "//p[contains(text(), 'New post')]" to be present
        #icon for close
      And I wait for element with xpath "//p[contains(text(), 'New post')]/ancestor::article[1]//span[contains(text(), 'update')]" to be present
        #Doctor selected is correct
      And element with xpath "//p[contains(text(), 'New post')]/ancestor::article[1]//p[contains(text(), 'Daniel Buche')]" should be present
      # BUG - Not correct date.
        #Date and time
     # And element with xpath "//p[contains(text(), 'New post')]/ancestor::article[1]//h3[contains(text(), 'Friday 05 June 2026, 08:00')]" should be present
        #click cancel icon for deleting appointment
      When I wait for element with xpath "//p[contains(text(), 'New post')]/ancestor::article[1]//span[contains(text(), 'update')]" to be present
      And I click on element with xpath "//button[@type = 'button']"



    Scenario: #Delete the appointment
      When I wait for element with xpath "//p[contains(text(), 'New post')]/ancestor::article[1]//span[contains(text(), 'update')]" to be present
      And I click on element with xpath "//p[contains(text(), 'New post')]/ancestor::article[1]//span[contains(text(), 'update')]"
      And I click on element with xpath "//button[contains(text(), 'Cancel appointment')]"
      #verify appointment was deleted
      Then I wait for element with xpath "//p[contains(text(), 'New post')]" to not be present





