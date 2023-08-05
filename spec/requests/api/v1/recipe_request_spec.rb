require "rails_helper"

RSpec.describe "Recipe API request" do
  describe "API request" do
    it "can request recipes based on country", :vcr do
      query_params = {country: "American"}
      get api_v1_recipes_path, params: query_params
      expect(response).to be_successful
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a(Array)
      expect(recipes[0][:name]).to eq("Frothy Iced Matcha Green Tea Recipe")
      expect(recipes[0][:country]).to eq(["american"])
      expect(recipes[0][:image]).to be_a(String)
      expect(recipes[0][:url]).to be_a(String)
    end
  end
end