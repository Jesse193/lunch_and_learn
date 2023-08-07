require "rails_helper"

RSpec.describe AirQuality, type: :model do
  describe "create air quality object" do
    it "has attributes" do
      data = {
        overall_aqi: 10,
          "PM2.5": {
            concentration: 10.2
          } ,
          CO: {
            concentration: 5.2
          }
        }

      air_quality = AirQuality.new(data)
      expect(air_quality).to be_a(AirQuality)
      expect(air_quality.aqi).to eq(10)
      expect(air_quality.pm25_concentration).to eq(10.2)
      expect(air_quality.co_concentration).to eq(5.2)
    end
  end
end