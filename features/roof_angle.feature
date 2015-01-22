Feature: Taking roof angle 
  In order to give information about angle of my roof
  I want to be able to use my phone to collect angle info
  And send it through

  Background: Selecting roof material
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page

  Scenario: As angle curious person
    Given I am on Roof Angle page and my roof is flat
    When I choose the flat roof option 
    Then I go to the next page

  Scenario: As angle curious person
    Given I am on Roof Angle page and my roof is sloped
    When I choose slope roof option
    Then I angle my phone and proceed to the next page
