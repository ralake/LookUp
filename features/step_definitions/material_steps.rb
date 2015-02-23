Given(/^I am on the material page$/) do
  find('#page_material').should be_visible
  page.should_not have_css('#page_photo')
end

When(/^I choose a roof material$/) do
  find("#metal").click
  click_on("OK, next")
end

Then(/^I should see the shading page$/) do
  find('#page_shade').should be_visible
  page.should_not have_css('#page_material')
end