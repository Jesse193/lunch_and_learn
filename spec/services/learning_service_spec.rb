require "rails_helper"

describe LearningService do
  context "class methods" do
    context "#video" do
      it "returns videos data", :vcr do
        country = "Canada"
        video = LearningService.new.video(country)
        expect(video).to be_a(Hash)
        expect(video[:items][0][:snippet]).to have_key(:title)
        expect(video[:items][0][:id]).to have_key(:videoId)
        expect(video[:items][0][:id]).to_not have_key(:comments)
      end
    end
  end
end

