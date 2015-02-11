Feature: Shading
  In order to give information about the shading of my roof
  As a person with a view of the roof in question
  I want to get some information and enter the data

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
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page

  @javascript
  Scenario: Assessing potential roof shading
    Given I am on shading page
    When I choose a shade value
    Then I should see the measurements page
