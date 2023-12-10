module Api::V1::Concerns
  module ExceptionsHandler
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed, with: :render_unprocessable_entity
      rescue_from Locations::GeoProviders::Base::RequestError, with: :render_provider_error
      rescue_from Locations::CreateService::Error, with: :render_create_error
    end

    private

    def render_unprocessable_entity(e)
      render json: build_error(e.record.errors.full_messages.to_sentence, 422), status: :unprocessable_entity
    end

    def render_create_error(e)
      render json: build_error(e.message, 422), status: :unprocessable_entity
    end

    def render_provider_error(e)
      render json: build_error(e.message, 422), status: :unprocessable_entity
    end

    def render_not_found(_e)
      render json: build_error(I18n.t('api.v1.exceptions.record_not_found'), 404), status: :not_found
    end

    def build_error(msg, status)
      {
        "errors": [
          {
            "status": status,
            "title": msg
          }
        ]
      }.to_json
    end
  end
end
