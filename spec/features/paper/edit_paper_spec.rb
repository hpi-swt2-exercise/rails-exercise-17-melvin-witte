require 'rails_helper'

describe "Edit paper page", type: :feature do
 
	it "should render the edit paper page without error" do
		paper = FactoryGirl.create(:paper)
		visit edit_paper_path(paper)
	end

	it "should have a form to change paper's details" do
		paper = FactoryGirl.create(:paper)
		visit edit_paper_path(paper)
		expect(page).to have_field('Title')
		expect(page).to have_field('Venue')
		expect(page).to have_field('Year')
	end

	it "should save the changes to the paper" do
		paper = FactoryGirl.create(:paper)
		visit edit_paper_path(paper)
		fill_in('Title', with: 'super')
		fill_in('Venue', with: 'better')
		fill_in('Year', with: 1960)
		find('input[type="submit"]').click
		
		paper.reload
		expect(paper.title).to eq('super')
		expect(paper.venue).to eq('better')
		expect(paper.year).to eq(1960)
	end
end