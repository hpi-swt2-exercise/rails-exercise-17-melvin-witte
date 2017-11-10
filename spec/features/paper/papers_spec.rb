require 'rails_helper'

describe "Paper index page", type: :feature do
 
	it "should render the paper index page without error" do
		visit papers_path
	end

	it "should render every paper's details, including title, venue and year" do
		paper = FactoryGirl.create(:paper)
		visit papers_path
		expect(page).to have_content(paper.title)
		expect(page).to have_content(paper.venue)
		expect(page).to have_content(paper.year)
	end

	it "should have a link to the new paper page" do
		visit papers_path
		expect(page).to have_link("Add paper", href: new_paper_path)
	end

	it "should have a link to a paper's page" do
		paper = FactoryGirl.create(:paper)
		visit papers_path
		expect(page).to have_link("Show", paper_path(paper))
	end

	it "should have a link to edit a paper's details" do
		paper = FactoryGirl.create(:paper)
		visit papers_path
		expect(page).to have_link("Edit", edit_paper_path(paper))
	end

	it "should have a link to delete a paper" do
		paper = FactoryGirl.create(:paper)
		visit papers_path
		expect(page).to have_link("Destroy")
	end

	it "sbould filter papers by year" do
		paper = create(:paper)
		expect(Paper.filter_year(2017)).to be_empty
		expect(Paper.filter_year(1950)).not_to be_empty
	end
end