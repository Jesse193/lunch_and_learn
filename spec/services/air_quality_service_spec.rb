require "rails_helper"

describe AirQualityService do
  context "class methods" do
    context "#air_quality" do
      it "returns air quality of a capital", :vcr do
        capital = "Paris"
        air_quality = AirQualityService.new.air_quality(capital)
        expect(air_quality).to be_a(Hash)
        expect(air_quality[:CO]).to have_key(:concentration)
        expect(air_quality[:CO]).to have_key(:aqi)
        expect(air_quality[:NO2]).to have_key(:concentration)
        expect(air_quality[:NO2]).to have_key(:aqi)
        expect(air_quality[:O3]).to have_key(:concentration)
        expect(air_quality[:SO2]).to have_key(:concentration)
        expect(air_quality[:SO2]).to have_key(:aqi)
        expect(air_quality[:"PM2.5"]).to have_key(:concentration)
        expect(air_quality[:"PM2.5"]).to have_key(:aqi)
        expect(air_quality[:PM10]).to have_key(:concentration)
        expect(air_quality[:PM10]).to have_key(:aqi)
        expect(air_quality).to have_key(:overall_aqi)
        expect(air_quality).to_not have_key(:puppies)
      end
    end
  end
end

