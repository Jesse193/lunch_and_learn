require "rails_helper"

RSpec.describe Video, type: :model do
  describe "creates video object" do
    it "has attributes" do
      data = {
        snippet: {
          title: "History"
        },
        id: {
          videoId: "1234"
        },
      }
      video = Video.new(data)
      expect(video).to be_a(Video)
      expect(video.title).to eq("History")
      expect(video.title).to be_a(String)
      expect(video.youtube_video_id).to eq("1234")
      expect(video.youtube_video_id).to be_a(String)
      expect(video.video).to eq({title: "History", youtube_video_id: "1234"})
      expect(video.video).to be_a(Hash)
      expect(video.id).to eq("null")

      expect(video.title).to_not be_a(Integer)
      expect(video.youtube_video_id).to_not be_a(Integer)
      expect(video.video).to_not be_a(Integer)
      expect(video.id).to_not be_a(Integer)
    end
  end
end