require 'rails_helper'

describe "Edit paper page", type: :feature do
 
	it "should render the edit paper page without error" do
		paper = create(:paper)
		visit edit_paper_path(paper)
	end

	it "should have a form to change paper's details" do
		paper = create(:paper)
		visit edit_paper_path(paper)
		expect(page).to have_field('Title')
		expect(page).to have_field('Venue')
		expect(page).to have_field('Year')
	end

	it "should save the changes to the paper" do
		paper = create(:paper)
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

	it "should have a dropdown selection for five authors" do
		paper = create(:paper)
		visit edit_paper_path(paper)
		expect(page).to have_selector('select', id: 'paper_author_1')
		expect(page).to have_selector('select', id: 'paper_author_2')
		expect(page).to have_selector('select', id: 'paper_author_3')
		expect(page).to have_selector('select', id: 'paper_author_4')
		expect(page).to have_selector('select', id: 'paper_author_5')
	end

	it "should save the author selection" do
		paper = create(:paper)
		another_author = Author.new(first_name: "Max", last_name: "Mustermann")
		another_author.save
		visit edit_paper_path(paper)
		select(another_author.name, from: 'paper_author_1')
		find('input[type="submit"]').click
		paper.reload
		expect(paper.authors).to include(another_author)
	end

	it "should have the current authors preselected" do
		paper = create(:paper)
		for i in [1..5]
			author = paper.authors[1]
			next if author.nil?
			expect(page).to have_select('paper_author_1', selected: author.name)
		end
	end
end