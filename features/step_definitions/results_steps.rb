Given(/^That there is a roof and I on results page$/) do
  @roof = Roof.create(angle: 0, gutter_edge: 20, angled_edge: 10, shade_value: 20, )
  visit("/roofs/#{@roof.id}/capacity/edit")
end

Then(/^I should see estimates fo solar panel and power capacity$/) do
  expect(page).to have_content("Estimated Solar Panel Capacity")  
end

When(/^I enter an invalid email address$/) do
  fill_in("email", with: "invalid_email")
  click_on("Send me the results")
end

Then(/^Should be told to enter it again$/) do
  expect(page).to have_content(" The email address you've entered is not valid. Please enter another")
end

When(/^I enter a valid email address$/) do
  fill_in("email", with: "email@valid.com")
  click_on("Send me the results")
end

Then(/^Should see (\d+):(\d+) homepage$/) do |arg1, arg2|
  expect(current_url).to eq('http://www.1010global.org/uk')
end

When(/^I don't enter an email address$/) do
  fill_in "email", with: ''
  click_on("Send me the results")
end
