require 'spec_helper'

describe SessionsController do
	describe '#create' do
		let!(:user) { FactoryGirl.create :user }

		context 'with valid credentials' do
			before do
				post :create, session: { email: user.email, password: user.password }
			end

			let(:found_user) { User.find_by email: user.email }
			let(:stored_token) { found_user[:remember_token] }
			let(:cookie_token) { response.cookies['remember_token'] }
			
			it 'should have matching remember tokens' do
				expect(stored_token).to eq stored_token
			end

			it 'should redirect to the admin page' do
				expect(response).to redirect_to admin_path
			end
		end # with valid credentials	
	
		context 'with invalid credentials' do
			render_views

			before do
				post :create, session: { email: user.email, password: 'invalid_password' }
			end

			it 'should render the new action' do
				expect(response.body).to have_content 'Sign In'
			end
		end # with invalid credentials
	end # create

	describe '#destroy' do

	end # destroy
end
