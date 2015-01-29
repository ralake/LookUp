Given(/^That there is a roof and I am on measurements page$/) do
  @roof = Roof.create(roof_angle: 0, gutter_edge: 20, angled_edge: 10, shade_value: 20)
  visit("/roofs/#{@roof.id}/measurements/edit")
  find("#map-canvas")
end

When(/^I measured both gutter and angled page$/) do
  find("#angled").set("7.4m")
  find("#gutter").set("7.4m")
  find("#btn-gutter").click
end

Then(/^I should see results of using LookUp$/) do
  expect(page).to have_content("Results")
end
