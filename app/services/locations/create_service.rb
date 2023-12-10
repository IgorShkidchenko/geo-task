module Locations
  class CreateService < ApplicationService
    class Error < StandardError; end

    def initialize(location_params)
      @ip = get_ip(location_params)
    end

    def call
      # no need to fire geo provider request without ip
      raise Error, I18n.t('api.v1.exceptions.invalid_ip_presence') unless @ip

      # add Location.exists?(ip: @ip) to check if location exists before firing geo provider request?
      Location.create!(
        ip: @ip,
        geo_data: fetch_data_from_geo_provider!
      )
    end

    private

    def get_ip(params)
      params[:ip].presence || GetIpsFromUrlService.call(params[:url])&.first
    end

    def fetch_data_from_geo_provider!
      GeoProviders::IpStack.call(@ip)
    end
  end
end
