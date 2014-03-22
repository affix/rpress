class IndexController < ApplicationController
	def index
		@posts = Post.all.order("id DESC").page(params[:page]).per(5)
	end
end
