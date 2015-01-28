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