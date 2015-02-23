Given(/^I am on the second information page$/) do
  page.should_not have_css('#page_information')
  find('#page_orientation').should be_visible
end

Then(/^I move on to the third information page$/) do
  click_on("Next")
  page.should_not have_css('#page_orientation')
  find('#pageFour').should be_visible
end