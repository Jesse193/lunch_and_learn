require "rails_helper"

describe LearningService do
  context "class methods" do
    context "#videos" do
      it "returns videos data", :vcr do
        country = "Canada"
        videos = LearningService.new.videos(country)
        expect(videos).to be_a(Hash)
        expect(videos[:items][0][:snippet]).to have_key(:title)
        expect(videos[:items][0][:id]).to have_key(:videoId)
        expect(videos[:items][0][:id]).to_not have_key(:comments)
      end
    end
  end
end

