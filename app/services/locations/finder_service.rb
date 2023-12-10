module Locations
  class FinderService < ApplicationService
    def initialize(location_params)
      @params = location_params
    end

    # combine all possible ips to make only one request to db
    def call
      ips = get_ips_from_url
      ips << @params[:ip] if @params[:ip].present?
      raise ActiveRecord::RecordNotFound if ips.empty?

      # additionally we can analyze incoming requests via AWS CloudWatchLogs and cache most searched ips
      Location.find_by!(ip: ips)
    end

    private

    def get_ips_from_url
      return [] if @params[:url].blank?

      GetIpsFromUrlService.call(@params[:url]) || []
    end
  end
end
