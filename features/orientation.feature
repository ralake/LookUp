Feature: Compass orientation 
  In order to use LookUp
  As a solar curious person 
  I want to be able to check orientation of my roof

  Background: Selecting roof material
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page

  Scenario: Using compass
    Given I am on the roof angle page
    When I happy with my compass position 
    Then I should be able to use app