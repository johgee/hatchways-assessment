Rails.application.routes.draw do
  scope :api do
    get "/posts", to: "posts#get_posts"

    get "/ping", to: "posts#get_ping"
  end
end
