Given(/^I am on the photo page$/) do
  find('#page_photo').should be_visible
  page.should_not have_css('#page_roof_angle')
  find('#screen').click
end

When(/^have taken a photo$/) do
  click_on('OK...')
end

Then(/^I arrive on the material page$/) do
  # find('#page_material').should be_visible
  page.should_not have_css('#page_photo')
end