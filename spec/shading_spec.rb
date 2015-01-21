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
  
end