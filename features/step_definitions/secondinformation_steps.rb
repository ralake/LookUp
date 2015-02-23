Given(/^I am on the second information page$/) do
  visit('/')
  page.execute_script("show('pageThree');")
  expect(page).to have_content("Where to put all those solar panels?")
end

Then(/^I move on to the third information page$/) do
  click_on("Next")
  expect(page).to have_content("When you're done, you can share your find")
end