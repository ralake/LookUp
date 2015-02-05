Feature: Taking roof angle
  In order to give information about the angle of my roof
  I want to be able to use my phone to collect angle information
  And move on to the next step

  xScenario: As person with a flat roof
    Given that there is a flat roof and I am on Roof Angle page
    When I choose the flat roof option
    Then I go to the photo page

  xScenario: As a person with a sloped roof
    Given that there is a sloped roof and I am on Roof Angle page
    When I proceed to the next page
    Then I angle my phone and move on to the next step
