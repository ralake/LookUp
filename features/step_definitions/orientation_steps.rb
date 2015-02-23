Given(/^I am on the orientation page$/) do
  find('#pageFive').should be_visible
  page.should_not have_css('#pageFour')
end

When(/^I am happy with my compass position$/) do
  find('#topage_roof_type').click
end

Then(/^I should proceed to the next step$/) do
  page.should_not have_css('#pageFiv')
  find('#page_roof_type').should be_visible 
end
