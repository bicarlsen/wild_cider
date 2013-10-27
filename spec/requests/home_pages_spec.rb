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

end
