require "rails_helper"

describe RecipeService do
  context "class methods" do
    context "#recipes" do
      it "returns recipes", :vcr do
        country = "American"
        recipes = RecipeService.new.recipes(country)
        expect(recipes[:hits][0][:recipe]).to have_key :label
        expect(recipes[:hits][0][:recipe]).to have_key :url
        expect(recipes[:hits][0][:recipe]).to have_key :cuisineType
        expect(recipes[:hits][0][:recipe]).to have_key :image
      end
    end
  end
end