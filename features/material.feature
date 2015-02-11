Feature: Material
  In order to give information about the material of my roof
  As a person who can see the roof in question
  I want to select the roof material

  Background: Using the app
    Given I visit the homepage
    When I decide to get started
    Then I should see the first introductory page
    Given I am on the first information page
    Then I move on to the second information page
    Given I am on the orientation page
    When I am happy with my compass position
    Then I should proceed to the next step
    Given I am on the roof type page
    When I select flat roof
    Then I should see the photo page
    Given I am on the photo page
    When have taken a photo
    Then I arrive on the material page

  @javascript
  Scenario: Selecting roof material
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page
