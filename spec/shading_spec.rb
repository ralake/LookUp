require 'spec_helper'

describe Roof do

  context 'Shading value' do
    def create_shade_value
      visit '/shading'
      fill_in "shade_value", with: "1"
      click_on "Next"
    end

    it "creates record in the database" do
      expect { create_shade_value }.to change { Roof.count }.by 1
    end

    it 'holds the specific shade value set by the user' do
      create_shade_value
      expect(Roof.first.shade_value).to eq 1
    end
  end

  context 'Roof material' do
    def submit_material 
      visit '/material'
      find("input[value='tiles']").click
      click_on "Next"
    end

    it "creates record in Roof instance" do
      expect { submit_material }.to change { Roof.count }.by 1
    end

    it "creates record in Roof instance" do
      submit_material
      expect(Roof.first.material).to eq "tiles"
    end

  end
end