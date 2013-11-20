# FILE: factories.rb
#
# Contains FactoryGirl factories for testing

FactoryGirl.define do
	# User
	factory :user  do
		sequence(:name) { |n| "User #{n}" }
		sequence(:email) { |n| "user_#{n}@test.com" }
		password 'password'
		password_confirmation 'password'

		factory :admin do
			admin true
		end
	end # user

	# Updates
	factory :update do
		sequence(:title) { |n| "Update #{n}" }
		description { Faker::Lorem.sentences(5).join(' ')}
		link_to { "http://www.google.com/search?q=#{title}" }
		post_at { Time.now }
		image_file do 
			file = File.new Rails.root + 'app/assets/images/test/temp_image_medium.png'
			file.rewind
			ActionDispatch::Http::UploadedFile.new tempfile: file, 
				original_filename: File.basename(file.path)
		end

		factory :past do
			post_at { Time.now - 1.day }
		end

		factory :future do
			post_at { Time.now + 1.day }
		end
				
	end # update

	# Ciders
	factory :cider do
		name { Faker::Name.name }
		description { Faker::Lorem.sentences(5).join('  ') }
		season 0
		image_file do 
			file = File.new Rails.root + 'app/assets/images/test/temp_image_medium.png'
			file.rewind
			ActionDispatch::Http::UploadedFile.new tempfile: file, 
				filename: File.basename(file)
		end

	end # cider

end # FactoryGirl.define











