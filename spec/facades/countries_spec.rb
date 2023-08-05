require "rails_helper"

RSpec.describe CountryFacade, type: :model do
  describe "#country" do
    it "can return a country by name", :vcr do 
      name = "USA"
      country = CountryFacade.new.country(name)
      expect(country).to be_a(Array)
      expect(country[0].name).to eq("United States of America")
      expect(country[0].capital).to eq(["Washington, D.C."])
      expect(country[0].demonym).to eq("American")
    end
  end
end
