Rails.application.routes.draw do
  get "/posts", to: "posts#get_posts"
  resources :posts
end
