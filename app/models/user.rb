# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	# attr_accessible :name, :email
	attr_accessor :password, :password_confirmation
	email_regex = /\A[\w+\-.]+@[a-z.]+\.[a-z]+\z/i
	validates :name,  :presence => true, 
					  :length => { :maximum => 50 }
	validates :email, :presence => true,
					  :format => { :with => email_regex },
					  :uniqueness => { :case_sensitive => false }
	validates :password, :presence => true, 
						 :confirmation => true,
						 :length => { :within => 6..40 }

	before_save :encrypt_password
	def has_password?(submitted_password)
		self.encrypted_password == encrypt(submitted_password)
	end

	class << self
		def authenticate(email, submitted_password)
			user = find_by_email(email)
			return nil if user.nil?
			return user if user.has_password?(submitted_password)
		end
	end
	private
	  def encrypt_password
	  	self.encrypted_password = encrypt(password)
	  	self.salt = make_salt if new_record?
	  end

	  def encrypt(string)
	  	secure_hash("#{salt}--#{string}")
	  end
	  def make_salt
	  	secure_hash("#{Time.now.utc}--#{password}")
	  end
	  def secure_hash(string)
	  	Digest::SHA2.hexdigest(string)
	  end
end
