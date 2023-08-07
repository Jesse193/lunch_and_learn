class AirQualitySerializer
  include JSONAPI::Serializer
  :data
  set_id :id
  set_type :air_quality
  attribute :city do |air_quality, params|
    params[:city]
  end

  attributes :aqi, :pm25_concentration, :co_concentration
end