Given(/^I am on the first information page$/) do
  visit('/')
  page.execute_script("show('pageTwo');")
  expect(page).to have_content('People everywhere are teaming up')
end

Then(/^I move on to the second information page$/) do
  click_on("Next")
  expect(page).to have_content('Where to put all those solar panels?')
end
