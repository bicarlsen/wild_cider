#--- Main ---
$(document).ready ->
	set_footer_position()
	display_quick_contact()

$(window).resize ->
	set_footer_position()
	display_quick_contact()

#--- Functions ---

# Sticks footer to bottom of page
set_footer_position = () ->
	footer = $('#site-footer')
	footer_top = footer.position().top
	footer_bottom = footer_top + footer.height()
	
	window_height = $( window ).height()
	body_height = $( 'body' ).height()

	if footer_bottom < window_height and window_height > body_height
		main_cont = $( '.main-content' )
		left = ( main_cont.outerWidth(true) - main_cont.width() ) / 2

		$( 'body' ).height( window_height )

		footer.css( 'position', 'absolute' )
		footer.css( 'bottom', '0' )
		footer.css( 'left', left )

# Displays or Hides Quick Contact Bar in Header
display_quick_contact = () ->
	cont = $( '#quick-contact' )
	ref_link = $( 'nav a' ).last()
	ref_link_right = ref_link.position().left + ref_link.width() +
		( ref_link.outerWidth() - ref_link.width() ) / 2 + 5
	
	if ( cont.position().left <= ref_link_right )
		cont.css( 'visibility', 'hidden' )
	else
		cont.css( 'visibility', 'visible' )

