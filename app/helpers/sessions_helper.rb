module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute :remember_token, User.encrypt(remember_token)
	end

	def sign_out
		current_user.update_attribute :remember_token, nil
		cookies.delete :remember_token
	end

	def signed_in?
		cookie_token = cookies[:remember_token]
		User.exists? remember_token: User.encrypt(cookie_token)
	end

	def current_user
		cookie_token = cookies[:remember_token]
		User.find_by remember_token: User.encrypt(cookie_token)
	end

	def must_be_signed_in  
		redirect_to signin_url, notice: 'Please sign in.' unless signed_in? 
	end

end
