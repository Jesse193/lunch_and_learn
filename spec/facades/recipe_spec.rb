require "rails_helper"

RSpec.describe RecipeFacade, type: :model do
  describe "#recipe" do
    it "can return recipes by country", :vcr do 
      country = "North America"
      recipes = RecipeFacade.new.recipes(country)
      expect(recipes).to be_a(Array)
    end
  end
end