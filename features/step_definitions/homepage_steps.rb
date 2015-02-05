Given(/^I visit the homepage$/) do
  visit('/')
  expect(page).to have_content("A rooftop treasure hunt for solar prospectors")
end

When(/^I decide to get started$/) do
  click_on('Start')
end

Then(/^I should see the introductory page$/) do
  expect(page).to have_content("People everywhere are teaming up to repower their town")
  page.should have_selector('#pageOne', visible: false)
end
