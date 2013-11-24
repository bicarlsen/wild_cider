module ApplicationHelper
	include SessionsHelper

	# Global variables
	
	def physical_address
		<<-eof
			11455 County Road 17<br />
			Firestone, CO 80504
		eof
	end

	def phone_number
		'(303) 532-9949'
	end

	def email
		'info@wildcider.com'
	end


end # module
