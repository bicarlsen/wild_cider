# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#--- Main ---
$(document).ready ->
	scroll_slide_show()




#--- Functions ---

# Index Page
# Activates the next feature image, and hides the current one
next_slide = (slideTime = 1300) ->
	totalImages = 4 #TODO: get this on the page, not hardcoded
	
	container = $('.slide-show')
	containerWidth = container.width()

	active = container.find('.active') # currently active image
	currentPosition = active.data('order')
	nextPosition = (currentPosition % totalImages) + 1
	next = container.find("[data-order=#{nextPosition}]")

	active.addClass('retiring')
	next.addClass('active')
	next.css('right', "-#{containerWidth}px")

	container.find('.active').animate({ right: "+=#{containerWidth}" }, slideTime,
				->
					active.removeClass('active retiring')
			)

# Index Page
# Scrolls the slide show images with animation
scroll_slide_show = (display_time = 8000, slide_time) ->
	setInterval(next_slide, display_time)
	


	







