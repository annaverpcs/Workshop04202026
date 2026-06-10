#author: Nataliya P
Feature: Nataliya - User story 1
	#Scenario: Login
		#Given NP opens Medical Center url "MediCenter v2 url"
 		#Then The NP page title is "Medicenter"
		#And NP wait for "//h1[contains(text(),'Medical Center')]" text
		#Then NP click on "Login" button
		#Then NP wait for "//a[contains(text(),'Back to home')]" text
		#Then NP wait for "//label[@for='email']" text
		#And NP type "patient3@gmail.com" to "Email" text field
		#And NP type "abc123" to "Password" text field
		#Then NP click on "Sign In" button
		#Then NP wait for 3 sec
	@login
	Scenario Outline: Nataliya - Login as Patient
		#converted scenario of Login to data-driven test cases
		Given NP opens Medical Center url "MediCenter v2 url"
		Then The NP page title is "Medicenter"
		And NP wait for "//h1[contains(text(),'Medical Center')]" text
		Then NP click on "Login" button
		Then NP wait for "//a[contains(text(),'Back to home')]" text
		Then NP wait for "//label[@for='email']" text
		And NP type <sEmail> to "Email" text field
		And NP type <sPassword> to "Password" text field
		Then NP click on "Sign In" button
		Then NP wait for 2 sec
		Then NP check login results is "<caseType>"

		Examples:
			| sEmail               | sPassword   | caseType |
			| "patient3@gmail.com" | "abc123"    | positive |
			| "administrator1@gmail.com" | "abc123" | positive |
			| "administrator2@gmail.com" | "abc123"    | positive |
			| "" | ""    | negative                               |
			| "patient3@gmail.com" | "invalid password"    | negative |
			| "   " | "   "    | negative                             |
			| "invalid@gmail.com" | "invalid password"    | negative  |


	#Scenario Outline: Nataliya - Login as Patient
	#	Given NP opens Medical Center url "MediCenter v2 url"
	#	Then The NP page title is "Medicenter"
	#	And NP wait for "//h1[contains(text(),'Medical Center')]" text
	#	Then NP click on "Login" button
	#	Then NP wait for "//a[contains(text(),'Back to home')]" text
	#	Then NP wait for "//label[@for='email']" text
	#	And NP type "patient3@gmail.com" to "Email" text field
	#	And NP type "abc123" to "Password" text field
	#	Then NP click on "Sign In" button
	#	Then NP wait for "//h1[													contains(text(),'Alice Wonderland')]" text
	#	Then element with xpath "//h1[contains(text(),'Alice Wonderland')]" should contain text "Alice Wonderland"
	#	Then NP wait for 3 sec

	@appointment
	Scenario Outline: Nataliya - Patient create and delete an appointment
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
		#Then element with xpath "//h1[contains(text(),'Alice Wonderland')]" should contain text "Alice Wonderland"
		Then NP wait for 1 sec
		Then NP click on "Make an appointment" button
		Then NP wait for "//span[contains(text(),'Make an appointment')]" text
		And NP type "<sText2>" to "Purpose" text field
		#And NP type "NP Pain Management" to "Purpose" text field
		Then NP wait for 1 sec
		Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='31d37556-f131-49fe-b2ae-4843eb11ab0b']"
		And NP type <value> into element with xpath "//input[@id='date']"
		#And NP type "Current date" into element with xpath "//input[@id='date']"
		Then NP wait for 1 sec
		Then NP click on element with xpath "//button[contains(text(),'01:00 PM')]"
		Then NP click on element with xpath "//button[@type='submit']"
		Then NP wait for "//p[contains(text(),'<sText2>')]/ancestor::article/div[1]/div" text
	  	#Then NP wait for "//article[contains(normalize-space(.),'<sText2>')]/div[1]/div" text
		#Then NP wait for "//p[contains(text(),'NP Pain Management')]/ancestor::article/div[1]/div" text
		Then NP click on element with xpath "//p[text()='Heinrich Faust']/ancestor::article//span[contains(text(),'update')]"
		Then NP wait for 1 sec
		Then NP click on "Delete an appointment" button
		Then NP wait for 1 sec
		Then NP wait for "//p[contains(text(),'<sText2>')]/ancestor::article/div[1]/div" text is invisible
		#Then NP wait for "//article[contains(normalize-space(.),'<sText2>')]/div[1]/div" text is invisible
		#Then NP wait for "//p[contains(text(),'NP Pain Management')]/ancestor::article/div[1]/div" text is invisible
		Then NP wait for 2 sec

		Examples:
			| sText2               | value          |
			| NP Pain Management   | "Current date" |
			| N | "Current date" |

	@forgotPassword
	Scenario Outline: Patient forgot password
		Given NP opens Medical Center url "MediCenter v2 url"
		Then The NP page title is "Medicenter"
		And NP wait for "//h1[contains(text(),'Medical Center')]" text
		Then NP click on "Login" button
		Then NP wait for "//a[contains(text(),'Back to home')]" text
		Then NP click on element with xpath "//a[@href='#auth-forgot-password']"
		Then NP wait for "//label[contains(text(),'Email address')]" text
		And NP type <sText> to "Email" text field
		Then NP wait for 1 sec
		Then NP click on "Send reset password" button
		Then NP wait for 2 sec
		Then NP check forgot password result is "<caseType>"
		Then NP wait for 2 sec

		Examples:
			| sText                | caseType |
			| "patient3@gmail.com" | positive |
			| "invalid@gmail.com"  | negative  |
			#| "invalid@"           | negative  |
			#| "invalidemail.com"   | negative  |
			| "" | negative                   |
			| "   " | negative                |
			#| "@gmail.com" | negative         |






