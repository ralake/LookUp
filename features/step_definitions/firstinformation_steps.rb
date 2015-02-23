Given(/^I am on the first information page$/) do
  page.should_not have_css('#page_index')
  find('#page_information').should be_visible
end

Then(/^I move on to the second information page$/) do
  click_on("Next")
  page.should_not have_css('#page_information')
  find('#page_orientation').should be_visible
end
