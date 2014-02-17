class HomePagesController < ApplicationController

	def index
		@updates = Update.where('post_at <= ?', Time.now.utc).
			where('advertisement IS NULL').
			order('post_at DESC').limit(3)

		@advertisements = Advertisement.active

		(@user = current_user) if signed_in?
			
	end # index

	def cider
		(@user = current_user) if signed_in?
		
		all_ciders = Cider.all
		@year_round_ciders = all_ciders.where season: 'Year Round'
		@summer_ciders = all_ciders.where season: 'Summer'
		@fall_ciders = all_ciders.where season: 'Fall'
		@winter_ciders = all_ciders.where season: 'Winter'
		@spring_ciders = all_ciders.where season: 'Spring'
	
	end # cider

	def about_us
		(@user = current_user) if signed_in?
		
		@people = Person.all
	end # about_us

	def contact_us
		(@user = current_user) if signed_in?
	end # contact_us

	def resources
		(@user = current_user) if signed_in?
	end # resources

	def admin
		@user = current_user

		unless signed_in? && @user.admin?
			redirect_to root_path
		end
	end # admin
end
