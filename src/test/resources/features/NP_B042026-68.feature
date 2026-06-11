Feature: Nataliya - User story 6
  @medicenter
  @appointment
  @negative
  Scenario Outline: Nataliya - Patient cannot create appointment: negative and boundary TC
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
    Then NP wait for 1 sec

    Then NP click on "Make an appointment" button
    Then NP wait for "//span[contains(text(),'Make an appointment')]" text

    And NP type "<sText2>" to "Purpose" purpose text field
    Then NP wait for 1 sec

    Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='31d37556-f131-49fe-b2ae-4843eb11ab0b']"
    And NP type "<value>" into element with xpath "//input[@id='date']"

    Then NP wait for 1 sec
    Then NP click on element with xpath "//button[contains(text(),'09:00 AM')]"
    Then NP click on element with xpath "//button[@type='submit']"

    Then NP handle appointment result is "<caseType>" for patient "Heinrich Faust" and purpose "<sText2>"

    Examples:
      | sText2      | value        | caseType |
      | [600_CHARS] | In two days | negative  |
      | [500_CHARS] | In two days | boundary  |

  @medicenter
  @appointment
  @negative
  @overlap
  Scenario: Nataliya - Patient cannot create overlapping appointment for same user
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
    Then NP wait for 1 sec

    # Create first appointment
    Then NP click on "Make an appointment" button
    Then NP wait for "//span[contains(text(),'Make an appointment')]" text
    And NP type "Overlap Base Appointment" to "Purpose" purpose text field
    Then NP wait for 1 sec
    Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='31d37556-f131-49fe-b2ae-4843eb11ab0b']"
    And NP type "Current date" into element with xpath "//input[@id='date']"
    Then NP wait for 1 sec
    Then NP click on element with xpath "//button[contains(text(),'01:00 PM')]"
    Then NP click on element with xpath "//button[@type='submit']"

    Then NP wait for "//p[contains(normalize-space(.),'Overlap Base Appointment')]/ancestor::article/div[1]/div" text

    # Try to create overlapping appointment
    Then NP click on "Make an appointment" button
    Then NP wait for "//span[contains(text(),'Make an appointment')]" text
    And NP type "Overlap Duplicate Appointment" to "Purpose" purpose text field
    Then NP wait for 1 sec
    Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='31d37556-f131-49fe-b2ae-4843eb11ab0b']"
    And NP type "Current date" into element with xpath "//input[@id='date']"
    Then NP wait for 1 sec
    Then NP click on element with xpath "//button[contains(text(),'01:00 PM')]"
    Then NP click on element with xpath "//button[@type='submit']"
    Then NP wait for 2 sec

    # Verify duplicate appointment was not created
    Then NP wait for "//p[contains(normalize-space(.),'Overlap Duplicate Appointment')]/ancestor::article/div[1]/div" text is invisible

    # Cleanup: delete first appointment
    Then NP click on element with xpath "//p[contains(normalize-space(.),'Overlap Base Appointment')]/ancestor::article//span[contains(normalize-space(.),'update')]"
    Then NP wait for 1 sec
    Then NP click on "Delete an appointment" button
    Then NP wait for 1 sec
    Then NP wait for "//p[contains(normalize-space(.),'Overlap Base Appointment')]/ancestor::article/div[1]/div" text is invisible


  @medicenter
  @appointment
  @negative
  @overlap
  Scenario: Nataliya - Patient cannot create overlapping appointment for same doctor
    Given NP opens Medical Center url "MediCenter v2 url"
    Then The NP page title is "Medicenter"
    And NP wait for "//h1[contains(text(),'Medical Center')]" text

    # Login as first patient
    Then NP click on "Login" button
    Then NP wait for "//a[contains(text(),'Back to home')]" text
    Then NP wait for "//label[@for='email']" text
    And NP type "patient3@gmail.com" to "Email" text field
    And NP type "abc123" to "Password" text field
    Then NP click on "Sign In" button
    Then NP wait for "//h1[contains(text(),'Alice Wonderland')]" text

    # Create first appointment
    Then NP click on "Make an appointment" button
    Then NP wait for "//span[contains(text(),'Make an appointment')]" text
    And NP type "Doctor Overlap Base Appointment" to "Purpose" purpose text field
    Then NP wait for 1 sec
    Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='31d37556-f131-49fe-b2ae-4843eb11ab0b']"
    And NP type "Current date" into element with xpath "//input[@id='date']"
    Then NP wait for 1 sec
    Then NP click on element with xpath "//button[contains(text(),'01:00 PM')]"
    Then NP wait for 1 sec
    Then NP click on element with xpath "//button[@type='submit']"
    Then NP wait for 2 sec
    Then NP wait for "//p[contains(normalize-space(.),'Doctor Overlap Base Appointment')]/ancestor::article/div[1]/div" text

    # Logout first patient
    Then NP click on "Logout" button

    # Login as second patient
    #Given NP opens Medical Center url "MediCenter v2 url"
    #Then The NP page title is "Medicenter"
    #And NP wait for "//h1[contains(text(),'Medical Center')]" text

    #Then NP click on "Login" button
    #Then NP wait for "//label[@for='email']" text
    #And NP type "patient2@gmail.com" to "Email" text field
    #And NP type "abc123" to "Password" text field
    #Then NP click on "Sign In" button
    #Then NP wait for 1 sec

    # Try to book same doctor, same date, same time
    #Then NP click on "Make an appointment" button
    #Then NP wait for "//span[contains(text(),'Make an appointment')]" text
    #And NP type "Doctor Overlap Duplicate Appointment" to "Purpose" purpose text field
    #Then NP wait for 1 sec
    #Then NP click on element with xpath "//select[@name='employee_id']/..//option[@value='31d37556-f131-49fe-b2ae-4843eb11ab0b']"
    #Then NP wait for 1 sec
    #And NP type "Current date" into element with xpath "//input[@id='date']"
    #Then NP wait for 1 sec
    #Then NP click on element with xpath "//button[contains(text(),'01:00 PM')]"
    #Then NP wait for 1 sec
    #Then NP click on element with xpath "//button[@type='submit']"
    #Then NP wait for 2 sec

    # Verify duplicate appointment was not created
    Then NP wait for "//p[contains(normalize-space(.),'Doctor Overlap Duplicate Appointment')]/ancestor::article/div[1]/div" text is invisible

    # Cleanup: logout second patient
    Then NP click on "Logout" button
    Then NP wait for 2 sec

    # Login again as first patient to delete original appointment
    Then NP click on "Login" button
    Then NP wait for "//label[@for='email']" text
    And NP type "patient3@gmail.com" to "Email" text field
    And NP type "abc123" to "Password" text field
    Then NP click on "Sign In" button
    Then NP wait for "//h1[contains(text(),'Alice Wonderland')]" text

    Then NP click on element with xpath "//p[contains(normalize-space(.),'Doctor Overlap Base Appointment')]/ancestor::article//span[contains(normalize-space(.),'update')]"
    Then NP wait for 1 sec
    Then NP click on "Delete an appointment" button
    Then NP wait for 1 sec
    Then NP wait for "//p[contains(normalize-space(.),'Doctor Overlap Base Appointment')]/ancestor::article/div[1]/div" text is invisible