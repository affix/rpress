class TagController < ApplicationController
	def index
		@tag = Tag.where("tag_slug='#{params[:slug]}'").first
		@posts = @tag.posts_by_tag
		Rails.logger.debug(@posts)
	end
end
