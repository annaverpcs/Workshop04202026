#author: Nataliya P
Feature: User story 1 using Selenium WebDriver + Cucumber + Maven
	Scenario: Login
		Given NP opens Medical Center url "MediCenter v2 url"
 		Then The NP page title is "Medicenter"
		And NP wait for "//h1[contains(text(),'Medical Center')]" text
		Then NP click on "Login" button
		Then NP wait for "//a[contains(text(),'Back to home')]" text
		Then NP wait for "//label[@for='email']" text
		And NP type "patient3@gmail.com" to "Email" text field
		And NP type "abc123" to "Password" text field
		Then NP click on "Sign In" button
		Then NP wait for 3 sec

	Scenario: Login as patient
		Given NP opens Medical Center url "MediCenter v2 url"
		Then The NP page title is "Medicenter"
		And NP wait for "//h1[contains(text(),'Medical Center')]" text
		Then NP click on "Login" button
		Then NP wait for "//a[contains(text(),'Back to home')]" text
		Then NP wait for "//label[@for='email']" text
		And NP type "patient3@gmail.com" to "Email" text field
		And NP type "abc123" to "Password" text field
		Then NP click on "Sign In" button
	    Then NP wait for "//h1[contains(text(),'Alice Wonderland')]" text
	    #Home page
	    #verification
	    Then element with xpath "//h1[contains(text(),'Alice Wonderland')]" should contain text "Alice Wonderland"
		Then NP wait for 3 sec

	Scenario: Patient create and delete an appointment
		Given NP opens Medical Center url "MediCenter v2 url"
		Then The NP page title is "Medicenter"
		And NP wait for "//h1[contains(text(),'Medical Center')]" text
		Then NP click on "Login" button
		Then NP wait for "//a[contains(text(),'Back to home')]" text
		Then NP wait for "//label[@for='email']" text
		And NP type "patient3@gmail.com" to "Email" text field
		And NP type "abc123" to "Password" text field
		Then NP click on "Sign In" button
		Then NP wait for "//h1[contains(text(),'Alice Wonderland')]" text
	    #Home page
	    #verification
		Then element with xpath "//h1[contains(text(),'Alice Wonderland')]" should contain text "Alice Wonderland"
		Then NP wait for 3 sec
	    #create an appointment
		Then NP click on "Make an appointment" button
		Then NP wait for "//span[contains(text(),'Make an appointment')]" text
		And NP type "NP Pain Management" to "Purpose" text field
		Then NP wait for 1 sec
		Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='918739d6-3970-4ca3-a17d-a6c0578d8e30']"
		And NP type "Current date" into element with xpath "//input[@id='date']"
		Then NP wait for 1 sec
		Then NP click on element with xpath "//button[contains(text(),'09:00 AM')]"
	    Then NP click on element with xpath "//button[@type='submit']"
	    #verify that the appointment is created
		Then NP wait for "//p[contains(text(),'NP Pain Management')]/ancestor::article/div[1]/div" text
		Then NP click on element with xpath "//p[text()='Daniel Buche']/ancestor::article//span[contains(text(),'update')]"
		Then NP wait for 1 sec
		Then NP click on "Delete an appointment" button
		Then NP wait for 1 sec
		Then NP wait for "//p[contains(text(),'NP Pain Management')]/ancestor::article/div[1]/div" text is invisible
		Then NP wait for 3 sec

	Scenario: Patient forgot password
		Given NP opens Medical Center url "MediCenter v2 url"
		Then The NP page title is "Medicenter"
		And NP wait for "//h1[contains(text(),'Medical Center')]" text
		Then NP click on "Login" button
		Then NP wait for "//a[contains(text(),'Back to home')]" text
		Then NP click on element with xpath "//a[@href='#auth-forgot-password']"
		Then NP wait for "//label[contains(text(),'Email address')]" text
		And NP type "patient3@gmail.com" to "Email" text field
		Then NP wait for 1 sec
		Then NP click on "Send reset password" button
		Then NP wait for 5 sec






