class PostsController < ApplicationController
  def index
    if session[:user_id].nil?
        puts 'No session established'
    end
  end
end

