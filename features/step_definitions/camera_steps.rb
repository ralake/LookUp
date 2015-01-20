Given(/^I'm on the camera page and I have read the instructions$/) do
visit '/photo'
click_link('Ok, I got it.')
end

Then(/^I should see 'Take Photo'$/) do
  pending # express the regexp above with the code you wish you had
end
