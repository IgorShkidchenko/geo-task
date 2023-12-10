class LocationSerializer
  include JSONAPI::Serializer

  set_type :location
  attributes :ip, :geo_data
end
