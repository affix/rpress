class PostController < ApplicationController
	def index
		@slug = params[:slug]
	end
end
