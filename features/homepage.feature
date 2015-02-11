Feature: Visiting the homepage
  In order to find out the solar capacity of a given roof
  As a solar-power curious person
  I want to use the lookup app.

@javascript
Scenario: Visiting the homepage
  Given I visit the homepage
  When I decide to get started
  Then I should see the first introductory page
