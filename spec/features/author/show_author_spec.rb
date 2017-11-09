require 'rails_helper'

describe "Show author page", type: :feature do
 
	it "should display the author's details" do
		author = create(:author)
		visit author_path(author)
		expect(page).to have_content(author.first_name)
		expect(page).to have_content(author.last_name)
		expect(page).to have_content(author.homepage)
	end

	it "should display the author's details in a very specific way" do
		author = create(:author)
		visit author_path(author)
		expect(page).to have_content("First name: " + author.first_name)
		expect(page).to have_content("Last name: " + author.last_name)
		expect(page).to have_content("Homepage: " + author.homepage)
	end
end