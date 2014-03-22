class IndexController < ApplicationController
	def index
		@posts = Post.all.order("created_at DESC").page(params[:page]).per(5)
	end
end
