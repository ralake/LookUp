require 'spec_helper'

describe Roof do
  context 'Shading value' do
    
    # before :each do
    #   visit '/shading'
    #   click_on "Next"
    # end

    def create_shade_value
      visit '/shading'
      click_on "Next"
    end

    it "creates record in the database" do
      expect { create_shade_value }.to change { Roof.count }.by 1
    end

    it 'holds the specific shade value set by the user' do
      expect(Roof.first.shade_value).to eq 0
    end
    
  end
end