Rails.application.routes.draw do

  namespace :v1 do
    jsonapi_resources :users, except: :destroy
    jsonapi_resources :timelines
    jsonapi_resources :timeline_entries
  end

end
