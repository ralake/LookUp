Feature: Orientation 
  In order to use LookUp
  As a solar curious person
  I want to be able to check orientation of my roof

  xScenario: Orientation with phone
    Given That there is a roof and I am on the roof angle page
    When I am happy with my compass position
    Then I should proceed to the next step
