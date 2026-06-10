# author: Anna V
# Medical Center scenarios
@medicenter @regressionTest
Feature: MediCenter Test Scenarios

  Background:
	Given I open url "https://medicenter-qa2.vercel.app/"
	When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
	Then I click on element with xpath "//button[contains(text(),'Login')]"
	Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
	And element with xpath "//label[@for='email']" should be present
	Then I clear element with xpath "//input[@id='email']"
	And I type "patient2@gmail.com" into element with xpath "//input[@id='email']"
	And I type "abc123" into element with xpath "//input[@id='password']"
	And I click on element with xpath "//button[@type='submit']"

  Scenario: Login as patient
	  	#Given I open url "https://medicenter-qa2.vercel.app/"
	   # When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
		#Then I click on element with xpath "//button[contains(text(),'Login')]"
	   # Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
	  	#And element with xpath "//label[@for='email']" should be present
	  	#Then I clear element with xpath "//input[@id='email']"
	    #And I type "patient2@gmail.com" into element with xpath "//input[@id='email']"
	  	#And I type "abc123" into element with xpath "//input[@id='password']"
	  	#And I click on element with xpath "//button[@type='submit']"
	Then I wait for element with xpath "//h1[contains(text(),'Ben Simpson')]" to be present
	  #Home page
	  #verification
	Then element with xpath "//h1[contains(text(),'Ben Simpson')]" should contain text "Ben Simpson"

  Scenario: Patient create and delete an appointment
	  # Given I open url "https://medicenter-qa2.vercel.app/"
	  # When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
	   #Then I click on element with xpath "//button[contains(text(),'Login')]"
	   #Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
	   #And element with xpath "//label[@for='email']" should be present
	   #Then I clear element with xpath "//input[@id='email']"
	  # And I type "patient2@gmail.com" into element with xpath "//input[@id='email']"
	   #And I type "abc123" into element with xpath "//input[@id='password']"
	   #And I click on element with xpath "//button[@type='submit']"
	Then I wait for element with xpath "//h1[contains(text(),'Ben Simpson')]" to be present
	  #Home page
	  #verification
	Then element with xpath "//h1[contains(text(),'Ben Simpson')]" should contain text "Ben Simpson"
	   #create an appointment
	When I click on element with xpath "//button[contains(text(),'Make an appointment')]"
	And I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
	Then I type "AnnaV appointment1233" into element with xpath "//textarea[@id='note']"
	Then I wait for 1 sec
	Then I click on element with xpath "//select[@name='employee_id']/..//option[@value='2be48518-cf67-46c7-ad0c-a0717434c2f5']"
	And I type "07/01/2026" into element with xpath "//input[@id='date']"
	Then I wait for 1 sec
	Then I click on element with xpath "//button[contains(text(),'08:30 AM')]"
	Then I click on element with xpath "//button[@type='submit']"
	   #verify that the appointment is created
	And I wait for element with xpath "//p[contains(text(),'AnnaV appointment1233')]/ancestor::article/div[1]/div" to be present
	And I wait for 5 sec
    #delete this appointment
	Then I wait for element with xpath "//p[contains(text(),'AnnaV appointment1233')]/ancestor::article/div[2]/span" to be present
	And I click on element with xpath "//p[contains(text(),'AnnaV appointment1233')]/ancestor::article/div[2]/span"
	#confirmation pop window
	Then I wait for element with xpath "//h2[contains(text(),'Are you sure you want to cancel appointment?')]" to be present
	And I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
	#verify that this appointment is cancelled
	And I wait for 1 sec
	And element with xpath "//p[contains(text(),'AnnaV appointment1233')]" should not be present