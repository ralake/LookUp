Given(/^I am on measurements page$/) do
  find('#pageEleven').should be_visible
  page.should_not have_css('#pageTen')
end

When(/^I measured both gutter and angled page$/) do
  find("#btn-angled").click
  find("#btn-gutter").click
end

Then(/^I should see results of using LookUp$/) do
  find('#pageTwelve').should be_visible
  page.should_not have_css('#pageEleven')
end
