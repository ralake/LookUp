def submit_material
  visit_homepage
  select_materials
end

def visit_homepage
  visit '/'
  click_on 'Get started!'
  click_on 'Next'
end

def select_materials
  visit '/material'
  choose 'tiles'
  click_on "Next"
end

def create_roof_instance
  @roof = Roof.create(angle: 0, angled_edge: 10, gutter_edge: 20, shade_value: 10)
  visit "/roofs/#{@roof.id}/capacity/edit"
  fill_in 'title', with: 'Test Roof'
  fill_in 'discovered_by', with: 'Test User'
  fill_in 'email', with: 'test@test.com'
  click_on 'Send me the results'
end
