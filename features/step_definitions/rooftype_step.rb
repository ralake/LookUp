Given(/^I am on the roof type page$/) do
  find('#pageFour').should be_visible
  page.should_not have_css('#pageSix')
end

When(/^I select flat roof$/) do
  find('#flatRoof').click
end

Then(/^I should the photo page$/) do
  find('#pageSix').should be_visible
  page.should_not have_css('#pageFour')
end