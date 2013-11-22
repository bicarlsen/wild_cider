class UpdatesController < ApplicationController
	before_action :must_be_signed_in
	
	def index
		time = 1.week.ago
		
		@updates = Update.where("updated_at >= :time OR post_at >= :time", time: time).
			order('post_at DESC')
	end

	def show
		@update = Update.find params[:id]
	end

	def new
		@update = Update.new
	end
	
	def create
		@update = Update.new update_params

		# try to save update
		if @update.save
			flash[:success] = 'Update created!'
			redirect_to updates_path
		else
			flash.now[:error] = 'There was an error creating your update.'
			render 'new'
		end
	end

	def update
	end

	def destroy
		update = Update.find params[:id]
		update.destroy

		flash[:success] = 'Update destroyed!'
		redirect_to updates_path
	end

	# Helper
	private

		def update_params
			params.require(:update).permit :title, :link_to, :post_at,
			 	:description, :image_file 
		end # update_params

end
