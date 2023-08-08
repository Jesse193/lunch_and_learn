class PhotoFacade
  def photos(country)
    service.photos(country)[:results].map do |data|
      Photo.new(data)
    end
  end

  def service
    service = PhotoService.new
  end
end