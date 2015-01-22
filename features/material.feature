Feature: Material
  In order to give information about the material of my roof
  As a person who can see the roof in question
  I want to select the roof material

  Scenario: Selecting roof material
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page