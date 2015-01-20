Feature:  InfoTom
          Should display information about technical Director Tom
          Should have swipe 

          Scenario: As a user of the app
            Given I am on infopage
            Then I shoud see text about Tom Parker 

          Scenario: As a user who wants to go to the next page
            Given I am on infopage
            Then I should see a button called Next