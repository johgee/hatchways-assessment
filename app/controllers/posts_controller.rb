class PostsController < ApplicationController
  require "rest-client"

  def get_posts
    user_search_params = params[:search]
    user_sort_by_params = params[:sort]
    user_directions_params = params[:directions]
    if !user_search_params
      render json: { error: "tags parameter required" }
    elsif params[:sort] && (["id", "likes", "reads", "popularity"].exclude?(params[:sort]))
      render json: { error: "Invalid sort paramater" }
    elsif params[:directions] && (["asc", "desc"].exclude?(params[:directions]))
      render json: { error: "Invalid directions paramater" }
    else
      response = RestClient.get("https://api.hatchways.io/assessment/blog/posts?tag=#{user_search_params}&sortBy=#{user_sort_by_params}&direction=#{user_directions_params}")
      render json: response
    end
  end

  def get_ping
    render json: {
      "success": true,
    }
  end
end
