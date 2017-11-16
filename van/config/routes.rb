Rails.application.routes.draw do
  resources :rides, only: [:index, :create, :show, :destroy] do
      collection do
        put 'update_with_complete/:id' => 'rides#update_with_complete'
      end
    end
end
