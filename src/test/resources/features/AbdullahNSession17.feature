#author: Abdullah
#Selenium Webdriver practice
  Feature: Selenium Webdriver practice
    Scenario: Login
      Given AbdullahN launch "Medicenter V2 URL"
      Then AbdullahN page title is "Medicenter"
      And AbdullahN wait for "//h1[contains(text(),'Medical Center')]" text
      Then AbdullahN click on "Login" button
      And AbdullahN wait for "//a[contains(text(),'Back to home')]" text
      Then AbdullahN wait for "//label[normalize-space()='Email address']" text
      And AbdullahN type "patient2@gmail.com" to "Email" textField
      And AbdullahN type "abc123" to "Password" textField
      And AbdullahN click on "Sign In" button
      Then I wait for 3 sec
