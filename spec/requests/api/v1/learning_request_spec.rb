require "rails_helper"

RSpec.describe "Learning video API request" do
  describe "API request" do
    it "can request videos and photos based on country", :vcr do
      query_params = {country: "Canada" }
      get  api_v1_learning_index_path(query_params)
      expect(response).to be_successful
      learning_material = JSON.parse(response.body, symbolize_names: true)
      expect(learning_material[:data][:type]).to eq("learning_resource")
      expect(learning_material[:data][:attributes]).to have_key(:country)
      expect(learning_material[:data][:attributes][:country]).to eq("Canada")
      expect(learning_material[:data][:attributes]).to have_key(:video)
      expect(learning_material[:data][:attributes][:video]).to have_key(:youtube_video_id)
      expect(learning_material[:data][:attributes][:video]).to have_key(:title)
      expect(learning_material[:data][:attributes][:video][:youtube_video_id]).to eq("e_okM7Mig6s")
      expect(learning_material[:data][:attributes][:video][:title]).to eq("A Super Quick History of Canada")
      expect(learning_material[:data]).to_not have_key(:likes)

      expect(learning_material[:data][:attributes]).to have_key(:photos)
      expect(learning_material[:data][:attributes][:photos].count).to eq(10)
      expect(learning_material[:data][:attributes][:photos].first).to have_key(:url)
      expect(learning_material[:data][:attributes][:photos].first).to have_key(:alt_tag)
    end
  end
end