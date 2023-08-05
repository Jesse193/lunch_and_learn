require "rails_helper"

RSpec.describe LearningFacade, type: :model do
  describe "#learning" do
    it "can return learning videos by country", :vcr do
      country = "England"
      learning = LearningFacade.new.videos(country)
      expect(learning).to be_a(Array)
      expect(learning[0].title).to eq("A Super Quick History of England")
      expect(learning[0].youtube_video_id).to eq("HYosjQArW3c")
    end
  end
end