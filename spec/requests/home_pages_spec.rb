require 'spec_helper'

describe "HomePages" do
	subject { page }

	describe "Home page" do
		before { visit root_path }
		
		it { should have_title "Wild Cider" }
	end # end Home Page

	describe "Cider page" do
		before { visit cider_path }

		it { should have_content "Cider" }
	end # end Cider page

	describe "About Us page" do
		before { visit about_us_path }

	end # end About Us page

	describe "Contact Us page" do
		before { visit contact_us_path }

	end # end Contact Us page

	describe "Sign In page" do
		before { visit signin_path }
		
		let(:user) { FactoryGirl.create :user }

		describe 'signing in' do
			describe 'with correct information' do
				before do
					fill_in 'Email', with: user.email
					fill_in 'Password', with: user.password	

					click_button 'Sign In'
				end

				it { should have_link 'Admin' }
			end # with correct information

			describe 'with invalid information' do
				describe 'with invalid email' do
					before do
					 	fill_in 'Email', with: 'invalid_email'
						fill_in 'Password', with: user.password

						click_button 'Sign In'
					end

					it { should have_content 'Invalid email/password combination' }
				end # with invalid email

				describe 'with invalid password' do
					before do
					 	fill_in 'Email', with: user.email
						fill_in 'Password', with: 'invalid_password'

						click_button 'Sign In'
					end

					it { should have_content 'Invalid email/password combination' }
				end # with invalid password

				describe 'with empty information' do
					before { click_button 'Sign In' }

					it { should have_content 'Invalid email/password combination' }
				end # with empty information

			end # with invlaid information
		end # signing in
	end # Sign In page

	describe 'Admin page' do
		pending 'Discreminate between admin adn non-admin'
		let!(:user) { FactoryGirl.create :user }
		#let!(:admin) { FacotryGirl.create :admin }

		context 'as a valid user' do
			before do
				sign_in user
				visit admin_path
			end

			it 'should be the Admin page' do
				expect(page).to have_content 'Admin'
			end # should be the Admin page
		end # as a valid user

		context 'as an invalid user' do
			before { visit admin_path }

			it 'should be the sign in page' do
				expect(page).to have_content 'Sign In'
			end # should be the sign in page	
		end # as an invalid user	
	end # Admin page

end # HomePages



















