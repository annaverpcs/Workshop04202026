#author: Anna
#Selenium WebDriver practice
@medicenter
Feature: Selenium WebDriver practice
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
	Then I should see page title contains "Medicenter"
	Then I wait for 3 sec
  @medicenter @smoke
  Scenario Outline: Login
	Given AnnaV launch "Medicenter V2 URL"
	Then AnnaV page title is "Medicenter"
	And AnnaV wait for "//h1[contains(text(),'Medical Center')]" text
	Then AnnaV click on "Login" button
	And AnnaV wait for "//a[contains(text(),'Back to home')]" text
	Then AnnaV wait for "//label[@for='email']" text
	And AnnaV type <sEmail> to "Email" textfield
	And AnnaV type <sPassword> to "Password" textfield
	Then AnnaV click on "Sign In" button
	Then I should see page title contains <pageTitle>
	Then I wait for <sec> sec

	Examples:
	  | sEmail               | sPassword   | pageTitle    | sec |
	  | "patient2@gmail.com" | "abc123"    | "Medicenter" | 1   |
	  | "administrator1@gmail.com" | "abc123"    | "Medicenter" | 1   |
	  | "administrator2@gmail.com" | "abc123"    | "Medicenter" | 1   |
	  | "" | ""    | "Medicenter" | 1   |
	  | "administrator2@gmail.com" | "invalid password"    | "Medicenter" | 1   |
