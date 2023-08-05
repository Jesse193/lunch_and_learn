class RecipeFacade
  def recipes(country)
    service.recipes(country).map do |data|
      Recipe.new(data)
    end
  end

  def service
    service = RecipeService.new
  end
end