require "rails_helper"

describe CountryService do
  context "class methods" do
    context "#country" do
      it "returns country data", :vcr do
        name = "USA"
        country = CountryService.new.country(name)
        expect(country).to be_a(Array)
        expect(country[0]).to have_key :capital
        expect(country[0][:capital]).to be_a Array
        expect(country[0][:capital]).to eq(["Washington, D.C."])
        expect(country[0][:demonyms][:eng][:m]).to eq("American")
        expect(country[0][:pie]).to eq(nil)
      end
    end
  end
end

