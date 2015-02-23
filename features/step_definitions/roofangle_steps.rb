Given(/^I am on the roof angle page and matched angle$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageSeven');")
  click_on("Capture!")
end

Then(/^I should move to photo page$/) do
  expect(page).to have_content("Snap a picture of the building. Make sure the roof is visible!")
end