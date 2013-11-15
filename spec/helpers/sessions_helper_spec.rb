require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe SessionsHelper do
	let!(:user) { FactoryGirl.create :user }
	
	before do
		helper.sign_in user
	end

	describe 'signing in' do
		it 'should be signed in' do
			expect(helper.signed_in?).to be_true
		end
	end # signing in

	describe 'signing out' do
		before do
			helper.sign_in user
			helper.sign_out
			user.reload
		end
		
		it 'should not be logged in' do
			expect(helper.signed_in?).to be_false
		end 

		it 'should not have a remember_token' do
			expect(user[:remember_token]).to be_nil	
		end 
	end # signing out

	describe 'current user' do
		context 'when signed in' do
			before do
				helper.sign_in user
			end

			it 'should be the current user' do
				expect(helper.current_user.email).to eq(user.email)
			end
		end # when signed in

		context 'when not signed in' do
			before do
				helper.sign_out
			end

			it 'should be nil' do
				expect(helper.current_user).to be_nil
			end
		end # when not signed in
	end # current user
end








