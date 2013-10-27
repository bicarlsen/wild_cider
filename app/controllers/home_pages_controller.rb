class HomePagesController < ApplicationController
	def index
	end

	def cider
		all_ciders = Cider.all
		@year_round_ciders = all_ciders.where season: 'Year Round'
		@summer_ciders = all_ciders.where season: 'Summer'
		@fall_ciders = all_ciders.where season: 'Fall'
		@winter_ciders = all_ciders.where season: 'Winter'
		@spring_ciders = all_ciders.where season: 'Spring'
	
	end

	def about_us
		@people = Person.all
	
	end

	def contact_us
	end

end
