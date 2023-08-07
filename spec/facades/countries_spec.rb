require "rails_helper"

RSpec.describe CountryFacade, type: :model do
  describe "#country" do
    it "can return a country by name", :vcr do 
      name = "USA"
      country = CountryFacade.new.country(name)
      expect(country).to be_a(Object)
      expect(country.name).to eq("United States of America")
      expect(country.capital).to eq(["Washington, D.C."])
      expect(country.demonym).to eq("American")
    end
  end
end
