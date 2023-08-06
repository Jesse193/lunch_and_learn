require "rails_helper"

RSpec.describe LearningFacade, type: :model do
  describe "#videos" do
    it "can return learning videos by country", :vcr do
      country = "England"
      learning = LearningFacade.new.videos(country)
      expect(learning).to be_a(Array)
      expect(learning[0].title).to eq("A Super Quick History of England")
      expect(learning[0].youtube_video_id).to eq("HYosjQArW3c")
    end
  end
  describe "#photos" do
    it "can return photos by country", :vcr do
      country = "Canada"
      photos = LearningFacade.new.photos(country)
      expect(photos).to be_a(Array)
      expect(photos[0].alt_tag).to be_a(String)
      expect(photos[0].url).to be_a(String)
    end
  end
end