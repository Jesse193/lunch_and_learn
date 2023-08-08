require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "creates recipe object" do
    it "has attributes" do
      data = {
       recipe: {
        label: "Recipe label",
        url: "ARecipeUrl",
        image: "ARecipePhoto.image"
       }
      }
      recipe = Recipe.new(data)
      expect(recipe).to be_a(Recipe)
      expect(recipe.title).to be_a(String)
      expect(recipe.title).to eq("Recipe label")
      expect(recipe.url).to be_a(String)
      expect(recipe.url).to eq("ARecipeUrl")
      expect(recipe.image).to be_a(String)
      expect(recipe.image).to eq("ARecipePhoto.image")
      expect(recipe.id).to eq("null")

      expect(recipe.title).to_not be_a(Integer)
      expect(recipe.url).to_not be_a(Integer)
      expect(recipe.image).to_not be_a(Integer)
      expect(recipe.id).to_not be_a(Integer)
    end
  end
end