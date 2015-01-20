Feature: Visiting the Photo Taking page
In order to take a picture
I read the instructions and
I take a picture with the phone's camera.

Scenario: Visiting the camera page
Given I'm on the camera page and I have read the instructions
When I decide to get started
Then I should see 'Take Photo'
