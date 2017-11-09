require 'rails_helper'

describe "Show author page", type: :feature do
 
	it "should display the author's details" do
		# FactoryGirl.find_definitions
		author = create(:author)
		visit author_path(author)
		expect(page).to have_content(author.first_name)
		expect(page).to have_content(author.last_name)
		expect(page).to have_content(author.homepage)
	end	
end