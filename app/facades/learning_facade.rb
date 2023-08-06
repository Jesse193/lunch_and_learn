class LearningFacade
  def videos(country)
    service.videos(country)[:items].map do |data|
      Learn.new(data)
    end
  end

  def photos(country)
    photos_service.photos(country).map do |data|
      Photo.new(data)
    end
  end

  def service
    service = LearningService.new
  end

  def photos_service
    service = PhotoService.new
  end
end