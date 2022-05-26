class PostsController < ApplicationController
  require "rest-client"

  def get_posts
    url = "https://api.hatchways.io/assessment/blog/posts"
    response = RestClient.get(url)
    render json: response
  end

  # def get_posts
  #   url = "https://api.hatchways.io/assessment/blog/posts"
  #   query_params = { 'tag': "tech" }
  #   response = RestClient.get(url, query: query_params)
  # end
end
