#--- Main ---
$(document).ready ->
	set_footer_position()

$(window).resize ->
	set_footer_position()


#--- Functions ---

# Sticks footer to bottom of page
set_footer_position = () ->
	footer = $('#site-footer')
	footer_bottom = footer.position().top + footer.height()
	
	window_height = $(window).height();
	body_height = $(body).height()

	if body_height < window_height and footer_bottom < window_height
		$('body').height( $(window).height() )
		footer.css('position', 'absolute')
		footer.css('bottom', '0')

		console.log('Set footer position.')



