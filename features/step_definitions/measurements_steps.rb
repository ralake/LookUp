Given(/^I am on measurements page$/) do
  find('#page_measurement').should be_visible
  page.should_not have_css('#page_shade')
end

When(/^I measured both gutter and angled page$/) do
  find("#btn-angled").click
  find("#btn-gutter").click
end

Then(/^I should see results of using LookUp$/) do
  find('#page_results').should be_visible
  page.should_not have_css('#page_measurement')
end
