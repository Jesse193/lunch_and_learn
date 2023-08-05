require "rails_helper"

RSpec.describe "Recipe API request" do
  describe "API request" do
    it "can request recipes based on country", :vcr do
      query_params = {country: "USA" }
      get api_v1_recipes_path, params: query_params
      expect(response).to be_successful
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a(Hash)
      expect(recipes[:data][0][:type]).to eq("recipe")
      expect(recipes[:data][0][:attributes][:title]).to eq("Frothy Iced Matcha Green Tea Recipe")
      expect(recipes[:data][0][:attributes][:country]).to eq(["american"])
      expect(recipes[:data][0][:attributes][:image]).to be_a(String)
      expect(recipes[:data][0][:attributes][:url]).to be_a(String)
    end
  end
end