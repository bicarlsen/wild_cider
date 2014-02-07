class CidersController < ApplicationController
	before_action :must_be_signed_in, :must_be_admin

	def index
		@ciders = Cider.all
	end

	def show
		@cider = Cider.find params[:id]
	end
	
	def new
		@cider = Cider.new
	end

	def create
		@cider = Cider.new cider_params

		if @cider.save
			flash[:success] = 'Cider created!'
			redirect_to ciders_path
		else
			flash.now[:error] = 'There was an error creating your cider.'
			render 'new'
		end
	end

	def edit 
		@cider = Cider.find params[:id]
	end

	def update
		#@cider = Cider.find params[:id]
		
		if @cider.update_attributes cider_params
			flash[:success] = 'Cider updated!'
			redirect_to ciders_path
		else
			flash.now[:error] = 'There was an error updating your cider.'
			render 'edit'
		end
	end

	def destroy
		cider = Cider.find params[:id]
		cider.destroy

		flash[:success] = 'Cider destroyed!'
		redirect_to ciders_path
	end

	private

		def cider_params
			params.require(:cider).permit :name, :description, :image_file, :season
		end

end
