require "rails_helper"

RSpec.describe VideoFacade, type: :model do
  describe "#videos" do
    it "can return learning video by country", :vcr do
      country = "England"
      video = VideoFacade.new.video(country)
      expect(video).to be_a(Object)
      expect(video.title).to eq("A Super Quick History of England")
      expect(video.youtube_video_id).to eq("HYosjQArW3c")
    end
  end
end