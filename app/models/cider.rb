class Cider < ActiveRecord::Base
	# Callbacks
	before_validation :resolve_season
	before_save :resolve_image

	# Validations
	validates :name, presence: true
	validates :image_file, presence: true

	SEASONS = ['Year Round', 'Summer', 'Fall', 'Winter', 'Spring']
	validates :season, presence: true, inclusion: SEASONS
	
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
	
		def resolve_season
			begin
				# Integer
				if self.season.is_a? Integer
					if (1..4).include? self.season
						self.season = SEASONS[self.season]
					else
						raise IndexError, "Index is not valid.  Must be (0..#{SEASONS.length-1})"
					end

				# String
				elsif self.season.is_a? String
					# capitalize first letter of each word
					self.season = self.season.downcase.split.map(&:capitalize).join(' ')
					if SEASONS.include? self.season
						self.season
					else
						raise KeyError, "Season is not valid.  Must be in #{SEASONS}"
					end
				end

			rescue IndexError
				self.season = 'invalid'
			end #rescue
		end # resolve_season

		def resolve_image
			unless self.image_file.is_a? String
				set_image(image_file)
			end
		end # resolve_image	

end
