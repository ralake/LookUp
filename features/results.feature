Feature: Results
  In order to get capacity
  When I've completed the steps
  I should see the outcome

  xScenario: Results
    Given That there is a roof and I on results page
    Then I should see estimates fo solar panel and power capacity

  xScenario: Enter invalid email
    Given That there is a roof and I on results page
    When I enter an invalid email address
    Then Should be told to enter it again

  xScenario: Enter valid email
    Given That there is a roof and I on results page
    When I enter a valid email address
    Then Should see 10:10 homepage

  xScenario: Enter no email
    Given That there is a roof and I on results page
    When I don't enter an email address
    Then Should see 10:10 homepage