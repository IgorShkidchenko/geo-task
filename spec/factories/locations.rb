FactoryBot.define do
  factory :location do
    ip       { '172.67.73.233' }
    geo_data { { latitude: 34.0453, longitude: -118.2413 }.to_json }
  end
end
