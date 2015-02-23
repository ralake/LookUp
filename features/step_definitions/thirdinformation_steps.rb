Given(/^I am on the third information page$/) do
  page.should_not have_css('#page_orientation')
  find('#pageFour').should be_visible
end

Then(/^I move on to the orientation page$/) do
  click_on("Let's go!")
  page.should_not have_css('#pageFour')
  find('#pageFive').should be_visible
end