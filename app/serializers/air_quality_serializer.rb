class AirQualitySerializer
  include JSONAPI::Serializer
  :data
  set_id :id
  set_type :air_quality
  attributes :aqi, :pm25_concentration, :co_concentration
end