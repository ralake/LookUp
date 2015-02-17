Given(/^I am on the third information page$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageFour');")
  expect(page).to have_content("When you're done, you can share your find")
end

Then(/^I move on to the orientation page$/) do
  click_on("Let's go!")
  expect(page).to have_content("Angle your phone square-on")
end