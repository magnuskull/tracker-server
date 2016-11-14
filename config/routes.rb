Rails.application.routes.draw do

  namespace :v1 do
    jsonapi_resources :users, except: :destroy
  end

end
