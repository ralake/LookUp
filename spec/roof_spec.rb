require 'spec_helper'

describe Roof do

  before :each do
    @roof = Roof.create
  end

  context "Updating itself" do

    it "updates the relevent information from params" do
      params = { "title" => "test title" }
      @roof.params_parser(params)
      expect(@roof.title).to eq "test title"
    end

    it "does not update information that it doesn't need" do
      params = { "test_property" => "test" }
      @roof.params_parser(params)
      expect(@roof).not_to respond_to :test_property
    end

  end

  context "calculates its capacities" do

    it "updates the panel and power capacities" do
      @roof.update(gutter_edge: "10", angled_edge: "20", angle: "0")
      @roof.set_capacities
      expect(@roof.panel_capacity).to eq 78
      expect(@roof.power_capacity).to eq 19.5
    end 

    it "estimates the amount of homes its solar panels could power" do
      @roof.update(power_capacity: 18, gutter_edge: "10", angled_edge: "20", angle: "0")
      @roof.set_capacities
      expect(@roof.homes_to_power).to eq 9
    end

  end

end
