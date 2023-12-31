class AirQuality
  attr_reader :aqi, :pm25_concentration, :co_concentration, :id
  def initialize(attributes)
    @aqi = attributes[:overall_aqi]
    @pm25_concentration = attributes[:"PM2.5"][:concentration]
    @co_concentration = attributes[:CO][:concentration]
    @id = "null"
  end
end