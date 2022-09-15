Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 namespace :api do
   namespace :v1 do
     post "/customers/:customer_id/subscriptions", to: 'customer_subscriptions#create'
     put "/customers/:customer_id/subscriptions", to: 'customer_subscriptions#update'
     get "/customers/:customer_id/subscriptions", to: 'customer_subscriptions#index'
   end
 end
end
