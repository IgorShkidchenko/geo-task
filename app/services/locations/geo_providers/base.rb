module Locations
  module GeoProviders
    class Base < ApplicationService
      class RequestError < StandardError; end

      def initialize(ip)
        @ip = ip
      end

      def call
        validate_response!
        fetched_data
      rescue StandardError => e
        # maybe we will need to add retry if something goes wrong with request logic via worker
        raise_request_error!(e.message)
      end

      private

      def fetched_data
        raise NotImplementedError
      end

      def validate_response!
        raise NotImplementedError
      end

      def raise_request_error!(msg = I18n.t('api.v1.exceptions.provider_error'))
        # add logger?
        raise RequestError, msg
      end
    end
  end
end
