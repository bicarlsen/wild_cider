class AdvertisementsController < ApplicationController
	before_action :must_be_signed_in
	
	def index
		@advertisements = Update.where('advertisement IS NOT NULL').
			order('advertisement ASC')
	end

	def show
		@advertisement = Update.find params[:id]
	end

	def new
		@advertisement = Update.new
	end

	def create
		@advertisement = Update.new advertisement_params

		if @advertisement.save
			flash[:success] = 'Ad created!'
			redirect_to advertisements_path
		else
			flash.now[:error] = 'There was an error creating your Ad.'
			render 'new'
		end
	end

	def destroy
		ad = Update.find params[:id]
		ad.destroy

		flash[:success] = 'Ad destroyed!'
		redirect_to advertisements_path
	end


	private
		
		def advertisement_params
			params.require(:update).permit :title, :image_file,
				:advertisement, :description
		end

end
