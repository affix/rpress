class Author < ActiveRecord::Base
	has_secure_password

	has_many :posts
	validates :email,  email_format: { message: "doesn't look like an email address" }
	validates_uniqueness_of :username, :email, :first_name, :last_name
end
