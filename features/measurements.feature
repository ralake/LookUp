Feature: Measurments
  In order to get estimate panels capacity and power capacity 
  I would like to measure length of gutter and angled edges 
  And see results after

  Scenario: Measuring gutter and angled edge
    Given That there is a roof and I am on measurements page
    When I measured both gutter and angled page
    Then I should see results of using LookUp