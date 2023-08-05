require "rails_helper"

RSpec.describe LearningFacade, type: :model do
  describe "#learning" do
    it "can return learning videos by country", :vcr do
      country = "USA"
      learning = LearningFacade.new.videos(country)
      expect(learning).to be_a(Array)
    end
  end
end