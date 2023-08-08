require "rails_helper"
RSpec.describe "Air quality request" do
  describe "air quality" do
    it "can return air quality of a capital by country", :vcr do
      query_params = {country: "France"}
      get  api_v1_air_quality_index_path, params: query_params
      expect(response).to be_successful
      air_quality = JSON.parse(response.body, symbolize_names: true)
      expect(air_quality).to be_a(Hash)
      expect(air_quality).to have_key(:data)
      expect(air_quality[:data]).to have_key(:attributes)
      expect(air_quality[:data][:attributes]).to have_key(:aqi)
      expect(air_quality[:data][:attributes]).to have_key(:pm25_concentration)
      expect(air_quality[:data][:attributes]).to have_key(:co_concentration)
      expect(air_quality[:data][:attributes]).to_not have_key(:puppies)
      expect(air_quality[:data][:attributes]).to_not have_key(:kittens)

      expect(air_quality[:data][:attributes][:aqi]).to be_a(Integer)
      expect(air_quality[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(air_quality[:data][:attributes][:co_concentration]).to be_a(Float)
    end
  end
end
