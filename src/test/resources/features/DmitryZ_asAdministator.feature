# author: Dmitry Z
# Medical center
  # create new specialist as Administrator
@medicenter @admin
Feature: Medicenter test as Administrator

  Background:
	#login as administrator
	Given I open url "https://medicenter-qa2.vercel.app/"
	When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
	Then I click on element with xpath "//button[contains(text(),'Login')]"
	Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
	And element with xpath "//label[@for='email']" should be present
	Then I clear element with xpath "//input[@id='email']"
	And I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
	And I type "abc123" into element with xpath "//input[@id='password']"
	And I click on element with xpath "//button[@type='submit']"
	Then I wait for element with xpath "//h1[contains(text(), 'Mary Poppins')]" to be present
	And I wait for 1 sec

  @admin
  Scenario: create new specialist
	#create new specialist
	When I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
	Then I click on element with xpath "//button[contains(text(),'Add specialist')]"
	And I wait for element with xpath "//span[contains(text(), 'New specialist')]" to be present
	And I type "Robin" into element with xpath "//input[@id='first_name']"
	And I type "Good" into element with xpath "//input[@id='last_name']"
	And I click on element with xpath "//select[@name='role']/option[contains(text(), 'Nurse')]"
	And I click on element with xpath "//button[@id='monday']"
	And I click on element with xpath "//button[@id='tuesday']"
	And I click on element with xpath "//button[@id='wednesday']"
	And I click on element with xpath "//button[@id='thursday']"
	And I click on element with xpath "//button[@id='friday']"
	And I click on element with xpath "//input[@id='working_hours.monday.from']"
	And I type "08:00" into element with xpath "//input[@id='working_hours.monday.from']"
	And I click on element with xpath "//input[@id='working_hours.monday.to']"
	And I type "16:00" into element with xpath "//input[@id='working_hours.monday.to']"

	And I click on element with xpath "//input[@id='working_hours.tuesday.from']"
	And I type "08:00" into element with xpath "//input[@id='working_hours.tuesday.from']"
	And I click on element with xpath "//input[@id='working_hours.tuesday.to']"
	And I type "16:00" into element with xpath "//input[@id='working_hours.tuesday.to']"

	And I click on element with xpath "//input[@id='working_hours.wednesday.from']"
	And I type "08:00" into element with xpath "//input[@id='working_hours.wednesday.from']"
	And I click on element with xpath "//input[@id='working_hours.wednesday.to']"
	And I type "16:00" into element with xpath "//input[@id='working_hours.wednesday.to']"

	And I click on element with xpath "//input[@id='working_hours.thursday.from']"
	And I type "08:00" into element with xpath "//input[@id='working_hours.thursday.from']"
	And I click on element with xpath "//input[@id='working_hours.thursday.to']"
	And I type "16:00" into element with xpath "//input[@id='working_hours.thursday.to']"

	And I click on element with xpath "//input[@id='working_hours.friday.from']"
	And I type "08:00" into element with xpath "//input[@id='working_hours.friday.from']"
	And I click on element with xpath "//input[@id='working_hours.friday.to']"
	And I type "16:00" into element with xpath "//input[@id='working_hours.friday.to']"
	And I click on element with xpath "//button[contains(text(),'Save')]"

  Scenario: verify
	#verify
	When I wait for element with xpath "//td[contains(text(),'Robin Good')]" to be present
      #type of Specialist
	Then element with xpath "//td[contains(text(),'Robin Good')]/ancestor::tr[1]//span[contains(text(),'Nurse')]" should be present
      #icon of "Edit"
	And I wait for element with xpath "//td[contains(text(),'Robin Good')]/ancestor::tr[1]//span[contains(text(),'edit')]" to be present
      #cancel of removing specialist
	And I click on element with xpath "//td[contains(text(),'Robin Good')]/ancestor::tr[1]//span[contains(text(),'delete')]"
	And I click on element with xpath "//span[contains(text(),'close')]"
      #edit Specialist's popUp
	When I click on element with xpath "//td[contains(text(),'Robin Good')]/ancestor::tr[1]//span[contains(text(),'edit')]"
	And I wait for 1 sec

	Then "First Name" textfield value should be "Robin"
	Then "Last Name" textfield value should be "Good"

	And element with xpath "//button[@id='monday' and @aria-checked='true']" should be present
	And element with xpath "//input[@id='working_hours.monday.from' and @value='08:00']" should be present
	And element with xpath "//input[@id='working_hours.monday.to' and @value='16:00']" should be present

	And element with xpath "//button[@id='tuesday' and @aria-checked='true']" should be present
	And element with xpath "//input[@id='working_hours.tuesday.from' and @value='08:00']" should be present
	And element with xpath "//input[@id='working_hours.tuesday.to' and @value='16:00']" should be present

	And element with xpath "//button[@id='wednesday' and @aria-checked='true']" should be present
	And element with xpath "//input[@id='working_hours.wednesday.from' and @value='08:00']" should be present
	And element with xpath "//input[@id='working_hours.wednesday.to' and @value='16:00']" should be present

	And element with xpath "//button[@id='thursday' and @aria-checked='true']" should be present
	And element with xpath "//input[@id='working_hours.thursday.from' and @value='08:00']" should be present
	And element with xpath "//input[@id='working_hours.thursday.to' and @value='16:00']" should be present

	And element with xpath "//button[@id='friday' and @aria-checked='true']" should be present
	And element with xpath "//input[@id='working_hours.friday.from' and @value='08:00']" should be present
	And element with xpath "//input[@id='working_hours.friday.to' and @value='16:00']" should be present

  Scenario: delete the Specialist
    #delete the Specialist
	When I wait for element with xpath "//td[contains(text(),'Robin Good')]" to be present
	Then I click on element with xpath "//td[contains(text(),'Robin Good')]/ancestor::tr[1]//span[contains(text(),'delete')]"
	And I click on element with xpath "//button[contains(text(),'Remove specialist')]"
    #verify that the Specialist was removed
	And I wait for element with xpath "//td[contains(text(),'Robin Good')]" to not be present