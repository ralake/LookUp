Given(/^I am on shading page$/) do
  find('#page_shade').should be_visible
  page.should_not have_css('#page_material')
end

When(/^I choose a shade value$/) do
  fill_in("shade_value", with: "10")
  click_on("Next") 
end

Then(/^I should see the measurements page$/) do
  find('#page_measurement').should be_visible
  page.should_not have_css('#page_shade')
end

