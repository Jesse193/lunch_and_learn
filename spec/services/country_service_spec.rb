require "rails_helper"

describe CountryService do
  context "class methods" do
    context "#country" do
      it "returns country data", :vcr do
        name = "USA"
        country = CountryService.new.country(name)
        expect(country).to be_a(Array)
        expect(country[0][:pie]).to eq(nil)
        expect(country[0]).to have_key :capital
        expect(country[0][:capital]).to eq(["Washington, D.C."])
      end
    end
  end
end

