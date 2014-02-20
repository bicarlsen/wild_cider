class CidersController < ApplicationController
	before_action :must_be_signed_in, :must_be_admin

	def index
		@user = current_user
		@ciders = Cider.all
	end

	def show
		@user = current_user
		@cider = Cider.find params[:id]
	end
	
	def new
		@user = current_user
		@cider = Cider.new
		@images = get_cider_labels
	end

	def create
		@user = current_user
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
		@user = current_user
		@cider = Cider.find params[:id]
		@images = get_cider_labels
	end

	def update
		@cider = Cider.find params[:id]
		
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

		def must_be_admin
			current_user.admin?
		end

		def get_cider_labels
			# get local images
			base_path = Rails.root + 'app/assets/images/ciders/'
			img_paths = Dir.glob([base_path + '*.jpg', base_path + '*.png'])
			img_paths.map! { |path| 
				[File.basename(path), 'ciders/' + File.basename(path)] 
			}
		end

end
