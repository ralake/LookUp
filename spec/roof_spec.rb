require 'spec_helper'

describe Roof do

    def submit_material 
      visit '/material'
      choose('tiles')
      click_on "Next"
    end

  context 'Roof material' do

    it "creates a record in the database" do
      expect { submit_material }.to change { Roof.count }.by 1
    end

    it "knows the material that the roof is made out of" do
      submit_material
      expect(Roof.first.material).to eq "tiles"
    end

  end

  context 'Shading value' do

    def create_shade_value
      visit '/shading'
      fill_in "shade_value", with: "1"
      click_on "Next"
    end

    before do
      submit_material
    end

    it 'holds the specific shade value set by the user' do
      create_shade_value
      roof = Roof.first
      expect(roof.shade_value).to eq 1
      expect(roof.material).to eq "tiles"
    end

  end

end

