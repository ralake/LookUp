Feature: Taking a photo
  In order to send an image to lookup
  As a user with a camera-phone
  I want to take an image

  @javascript
  Scenario: Taking a photo
    Given I am on the photo page
    When have taken a photo
    Then I arrive on the material page