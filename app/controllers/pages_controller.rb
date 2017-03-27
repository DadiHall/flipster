class PagesController < ApplicationController
  def index
  end

  def home
  	@posts = Post.all
  end

  def profile
  	#Grab the username from the URL as :id
  	if (User.find_by_username(params[:id]))
  	  @username = params[:id]
    else
    	#redirect to 404( root for now)
    	redirect_to root_path, :notice=> "User not Found!"
    end

    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)

    @newPost = Post.new
  end

  def explore
  	@posts = Post.all
  end
end
