Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plcs
  post "/send_command", to: "plcs#send_udp_command_to_plc"
end
 