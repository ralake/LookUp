Feature: Taking roof angle 
  In order to give information about angle of my roof
  I want to be able to use my phone to collect angle info
  And send it through

  Background: Visiting the homepage
    Given I visit the homepage
    When I decide to get started
    Then I should see the introductory page

  Scenario: As angle curious person
    Given I am on Roof Angle page and my roof is flat
    When I choose the flat roof option 
    Then I go to the next page

  Scenario: As angle curious person
    Given I am on Roof Angle page and my roof is sloped
    Then I angle my phone and proceed to the next page
