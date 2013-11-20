module HomePagesHelper

	def summarize(string, new_length = 100)
		if string.length > new_length # string is too long
			new_string = string.slice(0, new_length - 4)
			temp = new_string.split(' ') # split string at word breaks
			temp.pop # Remove last word to avoid partial words in new string
			new_string = temp.join(' ')
		 	new_string += ' ...'	
		else
			new_string = string
		end

		new_string
	end # end summarize

end
