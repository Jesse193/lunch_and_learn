require "rails_helper"

RSpec.describe AirQualityFacade, type: :model do
  describe "#air_quality" do
    it "can return air quality by capital", :vcr do 
      capital = "Paris"
      air_quality = AirQualityFacade.new.air_quality(capital)
      expect(air_quality).to be_a(Array)
    end
  end
end
