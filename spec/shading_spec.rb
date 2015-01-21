require 'spec_helper'

describe RoofRecord do
  context 'Shading value' do
    
    before :each do
      visit '/shading'
      click_on "Next"
    end

    it "creates record in the database" do
      expect(RoofRecord.count).to_change.by 1
    end

    it 'holds the specific shade value set by the user' do
      expect(RoofRecord.first.shading_data).to eq 0
    end
    
  end
end