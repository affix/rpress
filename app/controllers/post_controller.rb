class PostController < ApplicationController
	def index
		@post = Post.where("post_slug='#{params[:slug]}'").first
	end
end
