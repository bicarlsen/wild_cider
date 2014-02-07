class HomePagesController < ApplicationController

	def index
		@updates = Update.where('post_at <= ?', Time.now.utc).
			where('advertisement IS NULL').
			order('post_at DESC').limit(3)

		@advertisements = Advertisement.active
	end # index

	def cider
		all_ciders = Cider.all
		@year_round_ciders = all_ciders.where season: 'Year Round'
		@summer_ciders = all_ciders.where season: 'Summer'
		@fall_ciders = all_ciders.where season: 'Fall'
		@winter_ciders = all_ciders.where season: 'Winter'
		@spring_ciders = all_ciders.where season: 'Spring'
	
	end # cider

	def about_us
		@people = Person.all
	
	end # about_us

	def contact_us
	end # contact_us

	def resources
	end # resources

	def admin
		unless signed_in? && is_admin
			redirect_to root_path
		end
	end # admin
end
