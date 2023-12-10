# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
IPS = ['104.26.11.194', '104.22.52.237', '188.114.97.11']
Location.where(ip: IPS).destroy_all

# https://ipstack.com, www.ipstack.com, https://www.pstack.com
Location.create(ip: '104.26.11.194', geo_data: "{\"ip\": \"104.26.11.194\", \"type\": \"ipv4\", \"continent_code\": \"NA\", \"continent_name\": \"North America\", \"country_code\": \"US\", \"country_name\": \"United States\", \"region_code\": \"VA\", \"region_name\": \"Virginia\", \"city\": \"Ashburn\", \"zip\": \"20147\", \"latitude\": 39.043701171875, \"longitude\": -77.47419738769531, \"location\": {\"geoname_id\": 4744870, \"capital\": \"Washington D.C.\", \"languages\": [{\"code\": \"en\", \"name\": \"English\", \"native\": \"English\"}], \"country_flag\": \"https://assets.ipstack.com/flags/us.svg\", \"country_flag_emoji\": \"\�\�\�\�\", \"country_flag_emoji_unicode\": \"U+1F1FA U+1F1F8\", \"calling_code\": \"1\", \"is_eu\": false}}")
# https://dou.ua, www.dou.ua, https://www.dou.ua
Location.create(ip: '104.22.52.237', geo_data: "{\"ip\": \"104.22.52.237\", \"type\": \"ipv4\", \"continent_code\": \"NA\", \"continent_name\": \"North America\", \"country_code\": \"US\", \"country_name\": \"United States\", \"region_code\": \"CA\", \"region_name\": \"California\", \"city\": \"San Jose\", \"zip\": \"95122\", \"latitude\": 37.330528259277344, \"longitude\": -121.83822631835938, \"location\": {\"geoname_id\": 5392171, \"capital\": \"Washington D.C.\", \"languages\": [{\"code\": \"en\", \"name\": \"English\", \"native\": \"English\"}], \"country_flag\": \"https://assets.ipstack.com/flags/us.svg\", \"country_flag_emoji\": \"\�\�\�\�\", \"country_flag_emoji_unicode\": \"U+1F1FA U+1F1F8\", \"calling_code\": \"1\", \"is_eu\": false}}")
# https://nslookup.io, www.nslookup.io, https://www.nslookup.io
Location.create(ip: '188.114.97.11', geo_data: "{\"ip\": \"188.114.97.11\", \"type\": \"ipv4\", \"continent_code\": \"SA\", \"continent_name\": \"South America\", \"country_code\": \"CO\", \"country_name\": \"Colombia\", \"region_code\": \"ANT\", \"region_name\": \"Antioquia\", \"city\": \"Medell\ín\", \"zip\": \"050047\", \"latitude\": 6.251800060272217, \"longitude\": -75.5635986328125, \"location\": {\"geoname_id\": 3674962, \"capital\": \"Bogot\á\", \"languages\": [{\"code\": \"es\", \"name\": \"Spanish\", \"native\": \"Espa\ñol\"}], \"country_flag\": \"https://assets.ipstack.com/flags/co.svg\", \"country_flag_emoji\": \"\�\�\�\�\", \"country_flag_emoji_unicode\": \"U+1F1E8 U+1F1F4\", \"calling_code\": \"57\", \"is_eu\": false}}")
