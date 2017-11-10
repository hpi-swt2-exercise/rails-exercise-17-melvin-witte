require 'rails_helper'

describe "Edit author page", type: :feature do
 
	it "should render the edit author page without error" do
		author = FactoryGirl.create(:author)
		visit edit_author_path(author)
	end

	it "should have a form to change author's details" do
		author = FactoryGirl.create(:author)
		visit edit_author_path(author)
		expect(page).to have_field('First name')
		expect(page).to have_field('Last name')
		expect(page).to have_field('Homepage')
	end

	it "should save the changes to the author" do
		author = FactoryGirl.create(:author)
		visit edit_author_path(author)
		fill_in('First name', with: 'Johann')
		fill_in('Last name', with: 'Goethe')
		fill_in('Homepage', with: 'https://wikipedia.org/Johann_Wolfgang_von_Goethe')
		find('input[type="submit"]').click
		
		author.reload
		expect(author.first_name).to eq('Johann')
		expect(author.last_name).to eq('Goethe')
		expect(author.homepage).to eq('https://wikipedia.org/Johann_Wolfgang_von_Goethe')
	end
end