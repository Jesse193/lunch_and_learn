require "rails_helper"

RSpec.describe CountryFacade, type: :model do
  describe "#country" do
    country = CountryFacade.new.country(country)
    expect(country).to be_a(Hash)
  end
end
