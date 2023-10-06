Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plc_port, only: :show
  post "/send_command", to: "plc#send_udp_command_to_plc"
end
