class Update < ActiveRecord::Base
	# Callbacks
	before_validation :set_default_values
	before_save :resolve_image

	# Validations
	validates :title, presence: true
	validates :description, presence: true
	validates :image_file, presence: true
	validates :post_at, presence: true

	# Instance Methods
	def set_image(image_file)
		image_name = "#{Time.now.to_i}--#{image_file.original_filename}"
	
	  # set attribute
	  self.image_file = "updates/#{image_name}"
	            
		# write image to app/assets/images/updates
		File.open(Rails.root.join('app', 'assets', 'images', 
																'updates', image_name), 'wb') do |file|
			image_file.rewind
			file.write image_file.read
		end 
	end # set_image

	private
	
		def set_default_values 
			# standardize post_at times
			post_at ||= Time.now
			post_at = post_at.utc
		end # set_default_values

		# Saves image if needed and set the image_file attribute
		def resolve_image
			unless image_file.is_a? String
				set_image(image_file)
			end
		end # resolve_image
end
