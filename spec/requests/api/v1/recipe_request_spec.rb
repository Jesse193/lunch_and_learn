require "rails_helper"

RSpec.describe "Recipe API request" do
  describe "API request" do
    it "can request recipes based on country" do
      query_params = {country: "United States of America"}
      get api_v1_recipes_path, params: query_params
      expect(response).to be_successful
      recipe = JSON.parse(response.body, symbolize_names: true)
      expect(recipe).to be_a(Array)
    end
  end
end