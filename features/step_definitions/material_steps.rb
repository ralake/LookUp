Given(/^I am on the material page$/) do
  find('#pageSeven').should be_visible
  page.should_not have_css('#pageEight')
end

When(/^I choose a roof material$/) do
  find("#metal").click
  click_on("OK, next")
end

Then(/^I should see the shading page$/) do
  find('#pageEight').should be_visible
  page.should_not have_css('#pageSeven')
end