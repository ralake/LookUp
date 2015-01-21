Feature: Material
  In order to find give information about the material of my roof
  As a user of look up
  I want to select the roof material

  Scenario: Selecting roof material
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page