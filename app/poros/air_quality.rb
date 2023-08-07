class AirQuality
  attr_reader :air, :pm25_concentration, :co_concentration
  def initialize(attributes)
    @air = attributes[:overall_aqi]
    @pm25_concentration = attributes[:"PM2.5"][:concentration]
    @co_concentration = attributes[:CO][:concentration]
  end
end