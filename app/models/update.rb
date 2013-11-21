class Update < ActiveRecord::Base
	# Callbacks
	after_initialize :initialize_default_values
	before_save :resolve_image, :adjust_time

	# Validations
	validates :title, presence: true
	validates :description, presence: true
	validates :post_at, presence: true

	# Instance Methods
	
	def set_image(image_file)
		image_name = "#{Time.now.to_i}-#{image_file.original_filename}"
	
	  # set attribute
	  self.image_file = "updates/#{image_name}"
	            
		# write image to app/assets/images/updates
		File.open(Rails.root.join('app', 'assets', 'images', 
																'updates', image_name), 'wb') do |file|
			self.image_file.rewind
			file.write self.image_file.read
		end 
	end # set_image

	private
	
		def initialize_default_values
			self.post_at = Time.now
		end # initialize_default_values

		def adjust_time
			# standardize post_at times
			self.post_at = self.post_at.utc
		end # set_default_values

		# Saves image if needed and set the image_file attribute
		def resolve_image
			if self.image_file
				unless self.image_file.is_a? String
					set_image(image_file)
				end
			else
				self.image_file = 'updates/default.png'
			end
		end # resolve_image
end
