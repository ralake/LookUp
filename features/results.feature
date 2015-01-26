Feature: Results
  In order to get the roof's capacity for solar power
  As a person who has completed the mobile app stage
  I want to see the results of my roof survery

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

  Scenario: Seeing the results
    Given I am on the results page
    When I have reviewed the results of the survey
    Then I should be able to have the results sent to me