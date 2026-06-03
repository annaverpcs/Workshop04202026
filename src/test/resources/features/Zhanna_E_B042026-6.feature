# ZhannaE automated tests
# Medical Center scenarios
  
  Feature: MediCenter Test scenarios user story 3
    
    
    Scenario: Login as administrator test cases 3 B042026-67 Create specialist with valid first name,last name,
      specialist type,and working hours
      Given I open url "https://medicenter-qa2.vercel.app/"
      When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      And element with xpath "//label[@for='email']" should be present
      Then I click on element with xpath "//input[@id='email']"
      And I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for 5 sec
      When I wait for element with xpath "//button[@aria-haspopup='dialog' and contains(normalize-space(.),'Add specialist')]" to be present
      Then I click on element with xpath "//button[@aria-haspopup='dialog' and contains(normalize-space(.),'Add specialist')]"
      And I wait for 3 sec
      Then I wait for element with xpath "//input[@id='first_name']" to be present
      And I type "Anna Auto14" into element with xpath "//input[@id='first_name']"
      And I type "Smith Auto14" into element with xpath "//input[@id='last_name']"
      And I wait for 2 sec
      Then I wait for element with xpath "//label[@for='workingDays']" to be present
      And I click on element with xpath "//button[@id='monday']" 
      And I click on element with xpath "//input[@name='working_hours.monday.from']"
      Then I type "09:00" into element with xpath "//input[@name='working_hours.monday.from']"
      And I wait for 2 sec
      Then I click on element with xpath "//input[@name='working_hours.monday.to']"
      And I type "17:00" into element with xpath "//input[@name='working_hours.monday.to']"
      And I wait for 2 sec
      And I click on element with xpath "//button[normalize-space()='Save']"
      And I wait for 10 sec
      Given I open url "https://medicenter-qa2.vercel.app/admin"
      Then I wait for element with xpath "//button[@aria-haspopup='dialog' and contains(normalize-space(.),'Add specialist')]" to be present
      Then I scroll to the element with xpath "//button[@aria-haspopup='dialog' and contains(normalize-space(.),'Add specialist')]" with offset 8000
      And I wait for 3 sec
      Then I wait for element with xpath "//td[normalize-space()='Anna Auto14 Smith Auto14']" to be present
      #Delete created specialist from  the specialists list
      And I click on element with xpath "//tr[td[normalize-space()='Anna Auto14 Smith Auto14']]//span[contains(@class,'cursor-pointer')]"
      #Confirm specialist deletion in the confirmation modal
      Then I wait for element with xpath "//div[@role='dialog']//button[normalize-space()='Remove specialist']" to be present
      And I click on element with xpath "//div[@role='dialog']//button[normalize-space()='Remove specialist']"
      And I wait for 5 sec
      #Verify that be specialist was removed from the specialist list
      Given I open url "https://medicenter-qa2.vercel.app/admin"
      Then I wait for element with xpath "//button[@aria-haspopup='dialog' and contains(normalize-space(.),'Add specialist')]" to be present
      Then I scroll to the element with xpath "//button[@aria-haspopup='dialog' and contains(normalize-space(.),'Add specialist')]" with offset 8000
      And I wait for 3 sec
      Then I wait for element with xpath "//td[normalize-space()='Anna Auto14 Smith Auto14']" to not be present
