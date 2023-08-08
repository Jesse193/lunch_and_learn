require "rails_helper"

RSpec.describe RecipeFacade, type: :model do
  describe "#recipe" do
    it "can return recipes by country", :vcr do 
      country = "USA"
      demonym = "American"
      recipes = RecipeFacade.new.recipes(demonym, country)
      expect(recipes).to be_a(Array)
      expect(recipes[0].title).to eq("Usa-Style Pancake Recipe")
      expect(recipes[0].image).to be_a(String)
      expect(recipes[0].url).to eq("http://www.jamieoliver.com/recipes/other-recipes/pancakes-usa-stylie")
    end
  end
end