module Locations
  module GeoProviders
    class IpStack < Base
      ADDRESS = 'http://api.ipstack.com/'.freeze

      private

      def fetched_data
        @fetched_data ||= Net::HTTP.get(combine_url)
      end

      def combine_url
        URI.parse("#{ADDRESS}#{@ip}?access_key=#{access_key}")
      end

      def validate_response!
        error_msg = JSON.parse(fetched_data).dig('error', 'info')
        raise RequestError, error_msg if error_msg.present?
      rescue JSON::ParserError => e
        raise RequestError, e.message
      end

      # NOTE: this is only needed to simplify code review without passing project master key
      # for real project of course it will be hidden in env variable
      def access_key
        hash = {
          1 => 'b',
          2 => 'a',
          3 => 'e'
        }
        "019#{hash[3]}#{hash[2]}#{hash[1]}#{hash[1]}f123220c219f71#{hash[1]}9#{hash[2]}1c#{hash[1]}5844#{hash[3]}".reverse
      end
    end
  end
end
