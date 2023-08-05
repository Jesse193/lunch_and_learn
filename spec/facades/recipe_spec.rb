require "rails_helper"

RSpec.describe RecipeFacade, type: :model do
  describe "#recipe" do
    it "can return recipes by country", :vcr do 
      country = "American"
      recipes = RecipeFacade.new.recipes(country)
      expect(recipes).to be_a(Array)
      expect(recipes[0].name).to eq("Frothy Iced Matcha Green Tea Recipe")
      expect(recipes[0].country).to eq(["american"])
      expect(recipes[0].image).to be_a(String)
      expect(recipes[0].url).to eq("http://www.seriouseats.com/recipes/2016/08/iced-matcha-green-tea-recipe.html")
    end
  end
end