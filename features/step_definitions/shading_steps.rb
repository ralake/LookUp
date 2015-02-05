Given(/^I am on shading page$/) do
  find('#pageEight').should be_visible
  page.should_not have_css('#pageNine')
end

When(/^I choose a shade value$/) do
  fill_in("shade_value", with: "10")
  click_on("Next") 
end

Then(/^I should see the measurements page$/) do
  find('#pageNine').should be_visible
  page.should_not have_css('#pageEight')
end

