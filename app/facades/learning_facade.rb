class LearningFacade
  def videos(country)
    service.videos(country)[:items].map do |data|
      Learn.new(data)
    end
  end

  def service
    service = LearningService.new
  end
end