Feature: Results
  In order to get capacity
  When I've completed the steps
  I should see the outcome

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
    Given I am on shading page
    When I choose a shade value
    Then I should see the measurements page
    Given I am on measurements page
    When I measured both gutter and angled page
    Then I should see results of using LookUp

  @javascript
  Scenario: Results
    Given I on results page
    Then I should see estimates for solar panel and power capacity

  # xScenario: Enter invalid email
  #   Given That there is a roof and I on results page
  #   When I enter an invalid email address
  #   Then Should be told to enter it again

  # xScenario: Enter valid email
  #   Given That there is a roof and I on results page
  #   When I enter a valid email address
  #   Then Should see 10:10 homepage

  # xScenario: Enter no email
  #   Given That there is a roof and I on results page
  #   When I don't enter an email address
  #   Then Should see 10:10 homepage