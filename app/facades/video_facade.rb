class VideoFacade
  def video(country)
    Video.new(service.video(country)[:items][0])
  end

  def service
    service = VideoService.new
  end
end