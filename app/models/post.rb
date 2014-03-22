class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :author
	has_many :tags
end
