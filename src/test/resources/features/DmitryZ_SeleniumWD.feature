# author: Dmitry Z
# Medical center

  Feature: positive and negative test for Login, check requirements for email and password fields

    @Regression
    Scenario: #Login form fields should have correct requirements
      Given Please open "MedCenter URL V2"
      Then page title is "Medicenter"
      And wait for "//h1[contains(text(),'Medical Center')]" text
      And click on "Login" button
      And wait for "//a[contains(text(),'Back to home')]" text
      Then wait for "//label[@for='email']" text
      Then "Email" textfield should have type "email"
      Then "Password" textfield should have type "password"

    @Smoke
    Scenario Outline: #positive test for login
      Given Please open "MedCenter URL V2"
      Then page title is "Medicenter"
      And wait for "//h1[contains(text(),'Medical Center')]" text
      And click on "Login" button
      And wait for "//a[contains(text(),'Back to home')]" text
      Then wait for "//label[@for='email']" text
      And type <sEmail> to "Email" textfield
      And type <sPassword> to "Password" textfield
      Then click on "Sign In" button
      Then I expected message <sExpectedMessage>
      Then I should see page title contains "Medicenter"
      Then I wait for 2 sec

      Examples:
       |  sEmail                    | sPassword            |      sExpectedMessage          |
       | "patient2@gmail.com"       | "abc123"             |       "Ben Simpson"            |
       | "administrator1@gmail.com" | "abc123"             |       "Mary Poppins"           |


    Scenario Outline: #negativ test for Login
      Given Please open "MedCenter URL V2"
      Then page title is "Medicenter"
      And wait for "//h1[contains(text(),'Medical Center')]" text
      And click on "Login" button
      And wait for "//a[contains(text(),'Back to home')]" text
      Then wait for "//label[@for='email']" text
      And type <sEmail> to "Email" textfield
      And type <sPassword> to "Password" textfield
      Then click on "Sign In" button
      Then I expected message <sExpectedMessage>
      Then I wait for 2 sec

      Examples:
      | sEmail                     | sPassword        |    sExpectedMessage           |
      | "patient2@gmail.com"       | "wrong_pass"     |   "Invalid login credentials" |
      | "patient2@gmail.com"       |  ""              |   "Invalid login credentials" |



