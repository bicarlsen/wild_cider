class Advertisement < ActiveRecord::Base
	# Callbacks
	after_initialize :set_inital_values
	before_save :resolve_image, :resolve_position
	
	# Validations
	
	MAX_ADS = 10
	validates :title, presence: true
	validates :position, inclusion: { in: (1..MAX_ADS) }
	validates :image_file, presence: true

	# Instance Methods
	
	def set_image(image_file)
		image_name = "#{Time.now.to_i}-#{image_file.original_filename}"

		self.image_file = "advertisements/#{image_name}"

		File.open(Rails.root.join('app', 'assets', 'images', 'advertisements', 
															image_name), 'wb') do |file|
			image_file.rewind
			file.write image_file.read
		end
	end

	# Class Methods
	def Advertisement.active
		Advertisement.where active: true
	end


	private
		
		def set_inital_values
			self.active = true if self.new_record?
		end # set_inital_values

		def resolve_image
			if self.image_file
				unless self.image_file.is_a? String
					set_image image_file
				end
			end
		end # resolve_image

		def resolve_position
				Advertisement.where(active: true). 
											where(position: position).
											where.not(id: id).
											update_all(active: false)
		end # resolve_display_order

end # Advertisement
