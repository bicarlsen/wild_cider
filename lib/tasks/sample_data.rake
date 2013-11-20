namespace :db do
	desc 'Fill database with sample data' 
	task populate: :environment do
		make_users
		make_updates
		make_ciders
		make_people
	end # populate

	task populate_users: :environment do
		make_users
	end # populate_users

	task populate_updates: :environment do
		make_updates
	end # populate_updates

	task populate_ciders: :environment do
		make_ciders
	end # populate_ciders

	task populate_people: :environment do
		make_people
	end # populate_people	
end 


# HELPERS

def make_users
	User.create! name: 'Admin User', email: 'admin@test.com', 
		password: 'password', password_confirmation: 'password', admin: true

	User.create! name: 'Normal User', email: 'normal@test.com',
		password: 'password', password_confirmation: 'password'
end # make_users

def make_updates
	now = Time.now
	
	image_file = File.new Rails.root + 'spec/fixtures/images/temp_image_medium.png'
	image = ActionDispatch::Http::UploadedFile.new tempfile: image_file,
		filename: File.basename(image_file.path)
		
	# past posts
	30.times do |i|
		title = "Update #{i}"
		desc = Faker::Lorem.sentences(5).join ' ' 
		link = "http://www.google.com/search?q=#{1950 + i}" 
		post_at = (now - 20.days) + i.days

		Update.create! title: title, description: desc, image_file: image,
			link_to: link, post_at: post_at
	end
end # make_updates

def make_ciders
	image_file = File.new Rails.root + 'spec/fixtures/images/temp_image_medium.png'
	image = ActionDispatch::Http::UploadedFile.new tempfile: image_file,
		filename: File.basename(image_file.path)
	
	5.times do |season|
		3.times do |i|
			name = Faker::Name.name
			description =  Faker::Lorem.sentences(5).join('  ')
			
			Cider.create! name: name, description: description, 
				image_file: image, season: season
		end
	end # seasons
end # make_ciders

def make_people

end # make_people








