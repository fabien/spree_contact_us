Rails.application.routes.draw do
  match '/contact-us' => 'inquiries#index', :as => :contact

  resources :inquiries

  namespace :admin do
    resources :inquiries
    resource :inquiry_settings
  end

end
