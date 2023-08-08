require "rails_helper"

RSpec.describe Learn, type: :model do
  describe "creates learn object" do
    it "has attributes" do
      data = {
        snippet: {
          title: "History"
        },
        id: {
          videoId: "1234"
        },
      }
      learn = Learn.new(data)
      expect(learn).to be_a(Learn)
      expect(learn.title).to eq("History")
      expect(learn.title).to be_a(String)
      expect(learn.youtube_video_id).to eq("1234")
      expect(learn.youtube_video_id).to be_a(String)
      expect(learn.video).to eq({title: "History", youtube_video_id: "1234"})
      expect(learn.video).to be_a(Hash)
    end
  end
end