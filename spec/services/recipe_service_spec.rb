require "rails_helper"

describe RecipeService do
  context "class methods" do
    context "#recipes" do
      it "returns recipes", :vcr do
        country = "USA"
        demonym = "American"
        recipes = RecipeService.new.recipes(country, demonym)
        expect(recipes[:hits][0][:recipe]).to have_key :label
        expect(recipes[:hits][0][:recipe]).to have_key :url
        expect(recipes[:hits][0][:recipe]).to have_key :cuisineType
        expect(recipes[:hits][0][:recipe]).to have_key :image
        expect(recipes[:hits][0][:recipe]).to_not have_key :ice_cream
      end
    end
  end
end