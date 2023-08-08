require "rails_helper"

RSpec.describe "Recipe API request" do
  describe "API request" do
    it "can request recipes based on country", :vcr do
      query_params = {country: "USA"}
      get api_v1_recipes_path, params: query_params
      expect(response).to be_successful
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a(Hash)
      expect(recipes[:data][0][:type]).to eq("recipe")
      expect(recipes[:data][0][:attributes][:title]).to eq("Usa-Style Pancake Recipe")
      expect(recipes[:data][0][:attributes][:country]).to eq("United States of America")
      expect(recipes[:data][0][:attributes][:image]).to be_a(String)
      expect(recipes[:data][0][:attributes][:url]).to be_a(String)
      expect(recipes[:data][0].keys.count).to eq(3)
      expect(recipes[:data][0][:attributes].keys.count).to eq(4)
      expect(recipes[:data][0][:attributes]).to_not have_key(:ice_cream)
      expect(recipes[:data][0]).to_not have_key(:ingredients)
      expect(recipes[:data][0]).to_not have_key(:cheese)
    end
  end
end