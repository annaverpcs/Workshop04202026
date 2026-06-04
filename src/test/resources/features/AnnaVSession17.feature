#author: Anna
#Selenium WebDriver practice
  Feature: Selenium WebDriver practice
	@medicenter
	Scenario: Login
	  Given AnnaV launch "Medicenter V2 URL"
	  #Given AnnaV launch "Whatever"
	  Then AnnaV page title is "Medicenter"
	  And AnnaV wait for "//h1[contains(text(),'Medical Center')]" text
	  Then AnnaV click on "Login" button
	  And AnnaV wait for "//a[contains(text(),'Back to home')]" text
	  Then AnnaV wait for "//label[@for='email']" text
	  And AnnaV type "patient2@gmail.com" to "Email" textfield
	  And AnnaV type "abc123" to "Password" textfield
	  Then AnnaV click on "Sign In" button
	  Then I wait for 3 sec