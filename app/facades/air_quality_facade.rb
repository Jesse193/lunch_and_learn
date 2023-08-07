class AirQualityFacade

  def air_quality(capital)
    AirQuality.new(service.air_quality(capital))
  end

  def service
    service = AirQualityService.new
  end
end