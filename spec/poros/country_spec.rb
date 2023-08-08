require "rails_helper"

RSpec.describe Country, type: :model do
  describe "creates country object" do
    it "has attributes" do
      data = {
        name: {
          official: "USA"
        },
        capital: [
          "Washington D.C."
        ],
        demonyms: {
          eng: {
            m: "American"
          }
        }
      }
      country = Country.new(data)
      expect(country).to be_a(Country)
      expect(country.name).to eq("USA")
      expect(country.capital).to eq("Washington D.C.")
      expect(country.demonym).to eq("American")

      expect(country.name).to_not be_a(Integer)
      expect(country.capital).to_not be_a(Integer)
      expect(country.demonym).to_not be_a(Integer)
    end
  end
end