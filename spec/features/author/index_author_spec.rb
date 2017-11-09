require 'rails_helper'

describe "Author index page", type: :feature do
 
	it "should render the author index page without error" do
		visit author_index_path
	end

	it "should render every author's details, including name and homepage" do
		author = FactoryGirl.create(:author)
		visit author_index_path
		expect(page).to have_content(author.name)
		expect(page).to have_content(author.homepage)
	end
end