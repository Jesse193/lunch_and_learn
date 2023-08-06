require "rails_helper"

RSpec.describe "Learning video API request" do
  describe "API request" do
    it "can request videos based on country", :vcr do
      query_params = {country: "Canada" }
      get  api_v1_learning_index_path(query_params)
      expect(response).to be_successful
      videos = JSON.parse(response.body, symbolize_names: true)
      expect(videos[:data][:type]).to eq("learning_resource")
      expect(videos[:data][:attributes]).to have_key(:country)
      expect(videos[:data][:attributes][:country]).to eq("Canada")
      expect(videos[:data][:attributes]).to have_key(:video)
      expect(videos[:data][:attributes][:video]).to have_key(:youtube_video_id)
      expect(videos[:data][:attributes][:video]).to have_key(:title)
      expect(videos[:data][:attributes][:video][:youtube_video_id]).to eq("e_okM7Mig6s")
      expect(videos[:data][:attributes][:video][:title]).to eq("A Super Quick History of Canada")
      expect(videos[:data]).to_not have_key(:likes)
    end
  end
end