require "rails_helper"

describe AirQualityService do
  context "class methods" do
    context "#air_quality" do
      it "returns air quality of a capital", :vcr do
        capital = "Paris"
        capital = AirQualityService.new.air_quality(capital)
        expect(capital).to be_a(Hash)
        
      end
    end
  end
end

