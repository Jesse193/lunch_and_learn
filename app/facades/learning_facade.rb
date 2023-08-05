class LearningFacade
  def videos(channel, )
    service.videos(country)[:hits].map do |data|
      Recipe.new(data)
    end
  end

  def service
    service = RecipeService.new
  end
end