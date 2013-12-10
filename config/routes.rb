Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :reports, :only => [] do
      collection do
        get   :unavailable_products
        post  :unavailable_products
      end
    end
  end
end
