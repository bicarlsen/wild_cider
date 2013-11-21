class CidersController < ApplicationController
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

	end

	def update

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
