module Api
  module V1
    class LocationsController < ApiController
      before_action :set_location, only: %i[show destroy]

      def create
        location = Locations::CreateService.call(location_params)
        render json: LocationSerializer.new(location).serializable_hash.to_json, status: :created
      end

      def show
        render json: LocationSerializer.new(@location).serializable_hash.to_json, status: :ok
      end

      def destroy
        @location.destroy!
        head :no_content
      end

      private

      def set_location
        @location = Locations::FinderService.call(location_params)
      end

      def location_params
        params.require(:location).permit(:ip, :url)
      end
    end
  end
end
