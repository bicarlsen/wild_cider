require 'spec_helper'

describe "UpdatePages" do
	subject { page }
	let!(:user) { FactoryGirl.create :user }

	describe 'index page' do
		context 'having improper credentials' do
			before { visit updates_path }
			
			it { should have_content 'Sign In' }
		end # having improper credentials

		context 'having proper credentials' do
			before do
			 	sign_in user 
				visit updates_path
			end
			
			it { should have_content 'Recent Updates' }
			
			context 'with recent updates' do
				let!(:update) { FactoryGirl.create :update }
				before do
					5.times do
						FactoryGirl.create :update
					end

					visit updates_path # reload page
				end
				
				it { should have_selector 'ul#updates-list' }
				it { should have_selector 'li.update' } 
				#it { should have_link 'Edit' }
				it { should have_link update.title, update_path(update) }
				it { should have_link 'Delete' }
			end # with recent updates

			context 'without recent updates' do
				it { should have_content 'No Recent Updates'}
			end # without recent updates
		end # having proper credentials
	end # index page

	describe 'show update page' do
		let!(:update) { FactoryGirl.create :update }

		context 'with improper credentials' do
			before { visit update_path update }

			it { should have_content 'Sign In' }	
		end # with improper credentials

		context 'with proper credentials' do
			before do
				sign_in user
				visit update_path update
			end

			it { should have_content update.title }
			it { should have_content update.description }
			it { should have_content update.post_at }

			describe 'clicking delete link', js: true do
				before do
					click_link 'Delete'
					page.driver.browser.switch_to.alert.accept
				end

				it { should have_content 'Recent Updates' }
				it { should have content 'Update destroyed!' }
			end # clicking delete link
		end # with proper credentials
	end # show update page

	describe 'new update page' do
		context 'with improper credentials' do
			before { visit new_update_path }
			
			it { should have_content 'Sign In' }
		end # with improper credentials
		
		context 'with proper credentials' do
			before do
				sign_in user
				visit new_update_path
			end

			it { should have_content 'Create New Update' }
			it { should have_content 'Title' }
			it { should have_content 'Description' }
			it { should have_content 'Image' }
			it { should have_content 'Post' }
			it { should have_content 'Link' }	
			it { should have_button 'Submit' }

			describe 'create new update' do
				context 'wth correct information' do
					before do 
						fill_in 'Title', with: 'title'
						fill_in 'Link', with: 'http://www.google.com'
						fill_in 'Post', with: Time.now, match: :first
						fill_in 'Description', with: Faker::Lorem.sentences(5).join(' ')
						attach_file 'Image', Rails.root + 
							'spec/fixtures/images/temp_image_medium.png'

						click_button 'Submit'
					end

					it { should have_content 'Update created!' }
					it { should have_content 'Recent Updates' }
				end # with correct information

				context 'with incorrect information' do
					before { click_button 'Submit' }

					it { should have_content 'There was an error creating your update.' }
				end # with incorrect information
			end # create new update
		end # with proper credentials
	end # new update page

=begin
	describe 'edit an update' do
		# ADD CONTEXT OF PROPER AND IMPROPER CREDENTIALS
		let!(:update) { FactoryGirl.create :update }
		before { visit edit_update_path(update) }

		it { should have_content 'Create Update' }
		it { should have_content 'Title' }
		it { should have_content 'Description' }
		it { should have_content 'Image' }
		it { should have_content 'Post at' }
	  it { should have_content 'Link to' }			
	end # edit an update
=end

	describe 'delete an update' do
		let!(:update) { FactoryGirl.create :update }
		
		context 'with improper credentials' do
			before { delete update_path update }

			it 'should redirect to sign in page' do
				expect(response).to redirect_to signin_path
			end
		end # with improper credetials

		context 'with proper credentials' do
			before do 
				sign_in user
				visit updates_path 
			end

			it 'should destroy the update' do
				expect { click_link 'Delete' }.to change(Update, :count).by(-1)
			end
		end # with proper credentials
	end # delete an update

end # UpdatePages
