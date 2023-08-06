require "rails_helper"

RSpec.describe "Learning video API request" do
  describe "API request" do
    it "can request videos based on country", :vcr do
      query_params = {country: "Canada" }
      get  api_v1_learning_index_path, params: query_params
      expect(response).to be_successful
      videos = JSON.parse(response.body, symbolize_names: true)
      expect(videos[0]).to have_key(:title)
      expect(videos[0]).to have_key(:youtube_video_id)
      expect(videos[0][:title]).to eq("A Super Quick History of Canada")
      expect(videos[0][:youtube_video_id]).to eq("e_okM7Mig6s")
      expect(videos[0]).to_not have_key(:likes)
    end
  end
end