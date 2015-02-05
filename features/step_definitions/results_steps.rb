Given(/^I on results page$/) do
  find('#pageTen').should be_visible
end

Then(/^I should see estimates for solar panel and power capacity$/) do
  expect(page).to have_content("Looking good! Just a couple more things.")  
end

# When(/^I enter an invalid email address$/) do
#   fill_in("email", with: "invalid_email")
#   click_on("Send me the results")
# end

# Then(/^Should be told to enter it again$/) do
#   expect(page).to have_content(" The email address you've entered is not valid. Please enter another")
# end

# When(/^I enter a valid email address$/) do
#   fill_in("email", with: "email@valid.com")
#   click_on("Send me the results")
# end
# 
# Then(/^Should see (\d+):(\d+) homepage$/) do |arg1, arg2|
#   expect(current_url).to eq('http://www.1010global.org/uk')
# end

# When(/^I don't enter an email address$/) do
#   fill_in "email", with: ''
#   click_on("Send me the results")
# end
