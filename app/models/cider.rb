class Cider < ActiveRecord::Base
	# Callbacks
	before_validation :resolve_season
	before_save :resolve_image

	# Validations
	validates :name, presence: true
	validates :image_file, presence: true

	SEASONS = ['Year Round', 'Summer', 'Fall', 'Winter', 'Spring']
	validates :season, presence: true, inclusion: {in: SEASONS}
	
	# Instance Methods
	def set_image(image_file)
		image_name = "#{Time.now.to_i}-#{image_file.original_filename}"

		# set attribute
		self.image_file = "ciders/#{image_name}"

		#write image to app/assets/images/ciders
		File.open(Rails.root.join('app', 'assets', 'images', 
															'ciders', image_name), 'wb') do |file|
			image_file.rewind
			file.write image_file.read
		end
	end # set_image

	private
		
=begin
		Formats the season to check if it can be converted
		to a valid Season enum
=end
		def resolve_season
			# Integer
			if self.season.is_a? Integer
				if self.season.between?(0,5)
					self.season = SEASONS[self.season]
				else
					false
				end

			# String
			elsif self.season.is_a? String
				self.season.capitalize!
				SEASONS.include? self.season ? self.season : false
			end
		end # resolve_season

		def resolve_image
			unless image_file.is_a? String
				set_image(image_file)
			end
		end # resolve_image	

end
