class SessionsController < ApplicationController
	include SessionsHelper

	def new 
	end # new

	def create 
		user = User.find_by email: params[:session][:email].downcase

		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to root_path
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end # create

	def destroy
		sign_out
		redirect_to root_url
	end # destroy

end # SessionController
