require 'rails_helper'

describe "Show paper page", type: :feature do
 
	it "should render without error" do
		paper = FactoryGirl.create(:paper)
		visit paper_path(paper)
	end

	it "should display the paper's details" do
		paper = create(:paper)
		visit paper_path(paper)
		expect(page).to have_content(paper.title)
		expect(page).to have_content(paper.venue)
		expect(page).to have_content(paper.year)
	end

	it "should display the paper's authors" do
		author = create(:author)
		paper = create(:paper)
		visit paper_path(paper)
		paper.authors.each do |author|
			expect(page).to have_content(author.name)
		end
	end
end