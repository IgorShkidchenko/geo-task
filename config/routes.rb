Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :location, only: %i[create show destroy]
    end
  end
end
