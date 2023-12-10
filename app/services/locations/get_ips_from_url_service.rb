module Locations
  class GetIpsFromUrlService < ApplicationService
    def initialize(url)
      @url = url
    end

    def call
      ips = Resolv.getaddresses(@url)
      return ips if ips.present?

      parsed_url = URI.parse(@url).host
      Resolv.getaddresses(parsed_url)
    rescue StandardError
      nil
    end
  end
end
