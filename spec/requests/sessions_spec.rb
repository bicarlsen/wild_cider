require 'spec_helper'

describe "Sessions" do
	subject { page }
 	before  { visit signin_path }	
	
	describe 'sign in page' do
		it { should have_content 'Sign In' }
		it { should have_content 'Email' } 
		it { should have_content 'Password' }
	end # sign in page

	describe 'attempting to login' do
		let!(:user) { FactoryGirl.create :user }

		context 'with valid credentials' do
			before do
				fill_in 'Email', with: user.email
				fill_in 'Password', with: user.password

				click_button 'Sign In'
			end

			it 'should have admin navigation' do
				expect(page).to have_selector '.admin-navigation'
			end # should have admin navigation

			it 'should have a sign out link' do
				expect(page).to have_link 'Sign Out', href: signout_path
			end # should have a sign out link
		end # with valid credentials

		context 'with invalid credentials' do
			before do
				fill_in 'Email', with: user.email
				fill_in 'Password', with: 'invalid_password'

				click_button 'Sign In'
			end
			
			it 'should not have admin navigation' do
				expect(page).to_not have_selector '.admin-navigation'
			end # should not have admin navigation
		end	# with invalid credentials
	end # attemptiing to login	
end # Sessions
