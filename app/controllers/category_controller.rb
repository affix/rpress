class CategoryController < ApplicationController
	def index
		@category = Category.where("category_slug='#{params[:slug]}'").first
		@title = @category.category_title

		@posts = @category.posts
	end
end
