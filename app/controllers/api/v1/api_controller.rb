module Api
  module V1
    class ApiController < ApplicationController
      include Concerns::ExceptionsHandler
    end
  end
end
