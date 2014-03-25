class Tag < ActiveRecord::Base
	has_and_belongs_to_many :post

	def posts_by_tag
		post = []
		t = Tag.where("tag_slug = '#{self.tag_slug}'")
		t.each do |tag|
			post.push(Post.find(tag.post_id))
		end
		post
	end
end
