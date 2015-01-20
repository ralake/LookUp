Feature:  InfoTom
          Should display information about technical Director Tom
          Should have swipe 

          Scenario: As a user who wants to go to the next page
            Given I am on infopage
            When I read information I want to move to next page
            Then I should see take photo page