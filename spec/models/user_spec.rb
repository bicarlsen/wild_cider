require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.create :user }
	subject { user }

	it { should respond_to :name }
	it { should respond_to :email }
	it { should respond_to :password }
	it { should respond_to :password_confirmation }
	it { should respond_to :authenticate }
	it { should respond_to :admin }

	it { should be_valid }
	it { should_not be_admin }

	describe 'with admin attributte set to true' do
		before do
			user.save!
			user.toggle! :admin
		end

		it { should be_admin }
	end # with admin attribute set to true

end
