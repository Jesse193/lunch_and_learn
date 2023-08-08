require "rails_helper"

RSpec.describe Photo, type: :model do
  describe "creates Photo object" do
    it "has attributes" do
      data = {
        description: "Statue of liberty",
        urls: {
          regular: "APhotoLink"
        }
      }
      photo = Photo.new(data)
      expect(photo).to be_a(Photo)
      expect(photo.alt_tag).to eq("Statue of liberty")
      expect(photo.alt_tag).to be_a(String)
      expect(photo.url).to eq("APhotoLink")
      expect(photo.url).to be_a(String)

      expect(photo.alt_tag).to_not be_a(Integer)
      expect(photo.url).to_not be_a(Integer)
    end
  end
end