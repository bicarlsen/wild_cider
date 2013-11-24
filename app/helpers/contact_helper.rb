module ContactHelper
	def address_link
		link = link_to(
						raw(
							"<span class='address'>" +
								physical_address +
							"</span>"
						),
						'http://bing.com/maps/default.aspx?v=2&pc=FACEBK
							&mid=8100&where1=11455+County+Road+17%2C+Firestone%2C+Colorado+80504
							&FORM=FBKPL0&name=Wild+Cider&mkt=en-US',
						target: '_blank'
					)

		mod = "<div class='address-link'>#{link}</div>"
		mod.html_safe
	end # address_module

	def email_link
		link = mail_to email, email, subject: 'Contact Us', class: 'mail-link'

		mod = "<div class='email-link'>#{link}</div>"
		mod.html_safe
	end # email_link

end # module
