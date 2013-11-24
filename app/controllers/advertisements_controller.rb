class AdvertisementsController < ApplicationController
	before_action :must_be_signed_in
	
	def index
		@advertisements = Advertisement.all
	end

	def show
		@advertisement = Advertisement.find params[:id]
	end

	def new
		@advertisement =Advertisement.new
	end

	def create
		@advertisement = Advertisement.new advertisement_params

		if @advertisement.save
			flash[:success] = 'Ad created!'
			redirect_to advertisements_path
		else
			flash.now[:error] = 'There was an error creating your Ad.'
			render 'new'
		end
	end

	def edit
		@advertisement = Advertisement.find params[:id]
	end

	def update
		@advertisement = Advertisement.find params[:id]

		if @advertisement.update_attributes advertisement_params
			flash[:success] = 'Ad updated!'
			redirect_to @advertisement
		
		else
			flash.now[:error] = "There was an error updating your ad."
			render 'edit'
		
		end
	end

	def destroy
		ad = Advertisement.find params[:id]
		ad.destroy

		flash[:success] = 'Ad destroyed!'
		redirect_to advertisements_path
	end


	private
		
		def advertisement_params
			params.require(:advertisement).permit :title, :image_file,
				:position, :active, :display_caption, :caption
		end

end
