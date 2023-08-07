require "rails_helper"

RSpec.describe AirQualityFacade, type: :model do
  describe "#air_quality" do
    it "can return air quality by capital", :vcr do 
      capital = "Paris"
      air_quality = AirQualityFacade.new.air_quality(capital)
      expect(air_quality.aqi).to be_a(Integer)
      expect(air_quality.pm25_concentration).to be_a(Float)
      expect(air_quality.co_concentration).to be_a(Float)
      expect(air_quality.co_concentration).to_not be_a(String)
      expect(air_quality.aqi).to_not be_a(String)
      expect(air_quality.pm25_concentration).to_not be_a(String)
    end
  end
end
