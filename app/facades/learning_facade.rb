class LearningFacade
  def videos(country)
    service.videos(country).map do |data|
      Learn.new(data)
    end
  end

  def service
    service = LearningService.new
  end
end