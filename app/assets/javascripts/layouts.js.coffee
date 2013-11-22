# Main
$(document).ready ->
	set_footer_position()

# Sticks footer to bottom of page
set_footer_position = () ->
	footer = $('#site-footer')
	footer_bottom = footer.position().top + footer.height()

	if footer_bottom < $(window).height()
		$('body').height( $(window).height() )
		footer.css('position', 'absolute')
		footer.css('bottom', '0')

		console.log('Set footer position.')



