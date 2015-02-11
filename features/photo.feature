Feature: Taking a photo
  In order to send an image to lookup
  As a user with a camera-phone
  I want to take an image

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

  @javascript
  Scenario: Taking a photo
    Given I am on the photo page
    When have taken a photo
    Then I arrive on the material page