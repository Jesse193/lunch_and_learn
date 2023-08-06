require "rails_helper"

describe PhotoService do
  context "class methods" do
    context "#photos" do
      it "returns photos", :vcr do
        country = "Canada"
        photos = PhotoService.new.photos(country)
        expect(photos).to be_a(Hash)
        expect(photos[:results][0]).to have_key(:urls)
        expect(photos[:results][0]).to have_key(:tags)
        expect(photos[:results][0]).to_not have_key(:dogs)
        expect(photos[:results][0]).to_not have_key(:cats)
      end
    end
  end
end
