class RecipeFacade
  def recipes(demonym, country)
    service.recipes(demonym, country)[:hits].map do |data|
      Recipe.new(data)
    end
  end

  def service
    service = RecipeService.new
  end
end