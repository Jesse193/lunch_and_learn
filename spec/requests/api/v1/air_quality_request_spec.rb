require "rails_helper"
RSpec.describe "Air quality request" do
  describe "air quality" do
    it "can return air quality of a capital by country", :vcr do
      query_params = {country: "France"}
      get  api_v1_air_quality_index_path, params: query_params
      expect(response).to be_successful
      air_quality = JSON.parse(response.body, symbolize_names: true)
      expect(air_quality).to be_a(Hash)
    end
  end
end
