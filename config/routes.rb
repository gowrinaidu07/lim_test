Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'apipie/apipies#index'
  
  apipie
  namespace :api do
    scope :module => :v1, :path => 'v1' do
      get 'url' => 'web_sites#url'
      resources :web_sites, except: [:new, :edit,:update] do
      end
    end
  end

end
