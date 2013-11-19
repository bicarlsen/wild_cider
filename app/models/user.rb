class User < ActiveRecord::Base
	# Callbacks
	before_save do
		self.email = email.downcase
		:set_defaults
	end

	before_create :create_remember_token

	# Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, presence: true, length: { maximum: 75 }
	validates :email, presence: true, length: { maximum: 100 }, 
		uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	# Class Methods
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest token.to_s
	end

	# Helpers
	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end 

		def set_defaults
			admin ||= false
		end
end
