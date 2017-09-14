Rails.application.routes.draw do
  resources :users, only: %i[create update destroy]

  scope :auth do
    post   'login',  to: 'auth#create'
    delete 'logout', to: 'auth#destroy'
  end
end
