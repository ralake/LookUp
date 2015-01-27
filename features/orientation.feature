Feature: Orientation 
  In order to use LookUp
  As a solar curious person 
  I want to be able to check orientation of my roof

  Background: As a user who wants to go to the next page
    Given I am on the information page
    When I read information I want to move to next page
    Then I should see take photo page

  Scenario: Orientation with phone
    Given I am on the roof angle page
    When I happy with my compass position 
    Then I should be able to use app