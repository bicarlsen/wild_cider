#--- Main ---
$(document).ready ->
	set_footer_position()

$(window).resize ->
	set_footer_position()


#--- Functions ---

# Sticks footer to bottom of page
set_footer_position = () ->
	footer = $('#site-footer')
	footer_top = footer.position().top
	footer_bottom = footer_top + footer.height()
	
	window_height = $(window).height()
	body_height = $('body').height()

	if footer_bottom < window_height and window_height > body_height
		$('body').height(window_height)
		footer.css('position', 'absolute')
		footer.css('bottom', '0')


