require "rails_helper"

RSpec.describe PhotoFacade, type: :model do
  describe "#photos" do
    it "can return photos by country", :vcr do
      country = "Canada"
      photos = PhotoFacade.new.photos(country)
      expect(photos).to be_a(Array)
      expect(photos[0].alt_tag).to be_a(String)
      expect(photos[0].url).to be_a(String)
    end
  end
end