class Update < ActiveRecord::Base
	before_save :set_default_values

	
	private
	
		def set_default_values 
			self.post_at ||= Time.now.utc
			self.image_file ||= 'test/temp_image_medium.png'
		end

end
