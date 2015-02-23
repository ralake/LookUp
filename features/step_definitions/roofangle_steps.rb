Given(/^I am on the roof angle page and matched angle$/) do
  find('#page_roof_angle').should be_visible
  page.should_not have_css('#page_roof_type')
  click_on("Capture!")
end

Then(/^I should move to photo page$/) do
  find('#page_photo').should be_visible
  page.should_not have_css('#page_roof_angle')
end