require "rails_helper"
RSpec.describe "Country API request" do
  describe "country api" do
    it "can return country", :vcr do
      query_params = {country: "USA"}
      get api_v1_countries_path, params: query_params
      expect(response).to be_successful
      country = JSON.parse(response.body, symbolize_names: true)
      expect(country).to be_a(Object)

      expect(country[:name]).to eq("United States of America")
      expect(country[:capital]).to eq("Washington, D.C.")
      expect(country[:demonym]).to eq("American")
      expect(country).to_not have_key(:birds)
      expect(country).to_not have_key(:bugs)
      expect(country.keys.count).to eq(3)
    end

    it "can get random country", :vcr do
      query_params = {country: ""}
      get api_v1_countries_path, params: query_params
      expect(response).to be_successful
      country = JSON.parse(response.body, symbolize_names: true)
      expect(country).to be_a(Object)
      expect(country).to have_key(:name)
      expect(country).to have_key(:capital)
      expect(country).to have_key(:demonym)
    end

    it "returns error if no country found", :vcr do
      query_params = {country: "s23dfgbw4"}
      expect{get api_v1_countries_path, params: query_params}.to raise_error("Error: status: 400")
    end
  end
end
