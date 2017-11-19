Rails.application.routes.draw do
  resources :rides, only: [:index, :create, :show, :destroy] do
      collection do
        put 'update_with_complete/:id' => 'rides#update_with_complete'
        get 'waiting_rides' => 'rides#show_waiting_requests'
      end
    end
end
