Feature: Summary page
  In order to see the information that I have provided
  As a user who has completed the process
  I want to see the summary page

  Background: Using the app
    Given I am on the information page
    When I read information I want to move to next page
    Then I should see take photo page
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page
    Given I am on shading page
    When I choose a shade value
    Then I should see the roof angle page
    Given I am on Roof Angle page and my roof is flat
    When I choose the flat roof option
    Then I go to the next page
    Given I am on the roof angle page
    When I happy with my compass position 
    Then I should be able to use app

  Scenario: Visiting the summary page
    Given I visit the summary page
    When I decide that my information is correct
    Then I should submit my email and finish the process