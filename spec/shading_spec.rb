require 'spec_helper'

describe 'Shading value' do
  context 'user select shading value' do

    it "saves shading data to database" do
      expect(RoofRecord.count).to eq 0
      visit '/shading'
      click_on "Next"
      expect(RoofRecord.count).to eq 1
      expect(RoofRecord.first.shading_data).to eq 0
    end
  end
end