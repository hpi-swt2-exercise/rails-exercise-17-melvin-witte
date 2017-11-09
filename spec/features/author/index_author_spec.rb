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

	it "should list first and last name in one column and homepage in one column" do
		author = FactoryGirl.create(:author)
		visit author_index_path
		expect(page).to have_selector("th", text: "Name")
		expect(page).to have_selector("th", text: "Homepage")
		expect(page).to have_selector("td##{'name'}", text: author.name)
		expect(page).to have_selector("td##{'homepage'}", text: author.homepage)
	end

	it "should have a link to the new author page" do
		visit author_index_path
		expect(page).to have_link("Add author", href: new_author_path)
	end
end