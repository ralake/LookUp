Feature: Summary page
  Should display a summary of all information gathered
  Should have an input field for title and discovered by

Background: Visiting the homepage
  Given I visit the homepage
  When I decide to get started
  Then I should see the introductory page
  Given I am on the material page
  When I choose a roof material
  Then I should see the shading page
  Given I am on shading page
  When I choose a shade value
  Then I should see the roof angle page
  Given I am on Roof Angle page and my roof is flat
  When I choose the flat roof option
  Then I go to the next page
  Given I am on Roof Angle page and my roof is sloped
  Then I angle my phone and proceed to the next page


Scenario: As a user who collected all the data
  Given I am on the summary page
  When I have read all the information and entered my details
  Then I should see the thank you page
