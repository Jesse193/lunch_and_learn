class LearningFacade
  def video(country)
    Learn.new(service.video(country)[:items][0])
  end

  def photos(country)
    photos_service.photos(country)[:results].map do |data|
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