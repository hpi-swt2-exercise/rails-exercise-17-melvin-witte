require 'rails_helper'

describe "New author page", type: :feature do
 
	it "should render without error" do
		visit new_author_path
	end

	it "should have text input fields for 'first name', 'last name, 'homepage'" do
		visit new_author_path 
		expect(page).to have_field('First name')
		expect(page).to have_field('Last name')
		expect(page).to have_field('Homepage')
	end

	it "should have a submit button" do
		visit new_author_path
		expect(page).to have_css('input[type="submit"]')
	end

	it "should save a new author that is submitted" do
		visit new_author_path
		fill_in('First name', with: 'Alan')
		fill_in('Last name', with: 'Turing')
		fill_in('Homepage', with: 'http://wikipedia.org/Alan_Turing')
		find('input[type="submit"]').click

		author = Author.last
		expect(author.first_name).to eq('Alan')
		expect(author.last_name).to eq('Turing')
		expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
	end	

	it "should show an error message when creating an author without last name" do
		visit new_author_path
		fill_in('First name', with: 'Alan')
		fill_in('Last name', with: '')
		fill_in('Homepage', with: 'https://wikipedia.org/Alan_Turing')
		find('input[type="submit"]').click
		
		expect(page).to have_content("Last name can't be blank")

		fill_in('First name', with: 'Alan')
		fill_in('Last name', with: 'Turing')
		fill_in('Homepage', with: 'https://wikipedia.org/Alan_Turing')
		find('input[type="submit"]').click

		expect(page).to_not have_content("Last name can't be blank")
	end
end