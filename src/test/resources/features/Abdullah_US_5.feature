# author: abdullah N
# Medical Center User Story #5: As an administrator, I can add an appointment

  @Medicenter
  Feature: User Story #5: As an administrator, I can add an appointment

    Background: Login as an administrator

      Given I open url "https://medicenter-qa2.vercel.app/"
      When I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      And element with xpath "//label[normalize-space()='Email address']" should be present
      Then I clear element with xpath "//input[@id='email']"
      And I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[@type='submit']"


    Scenario: Verify the appointment tab is visible
      # Verify the appointment tab is visible TC: (https://portnov-online-school.atlassian.net/browse/B042026-192)
      Then I wait for element with xpath "//button[contains(text(),'Appointments')]" to be present

    Scenario: New appointment" window opens successfully
        # "New appointment" window opens successfully TC: (https://portnov-online-school.atlassian.net/browse/B042026-193)
      When I wait for element with xpath "//button[contains(text(),'Appointments')]" to be present
      When I click on element with xpath "//button[contains(text(),'Appointments')]"
      And I click on element with xpath "//button[@class='bg-teal-600 hover:bg-teal-700 focus:ring-teal-500 outline-teal-100 h-fit w-full whitespace-nowrap justify-center gap-2 inline-flex items-end rounded-md border border-transparent px-4 py-2 text-base font-medium text-white shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 transition-all duration-200 ease-in-out']"
      Then I wait for element with xpath "//span[contains(text(),'New appointment')]" to be present


  

