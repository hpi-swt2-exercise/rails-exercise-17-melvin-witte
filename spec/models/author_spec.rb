require 'rails_helper'

describe "Author model", type: :model do
 
	it "should have a first name, last name and homepage" do
		author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
		expect(author.first_name).to eq('Alan')
		expect(author.last_name).to eq('Turing')
		expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
	end

	it "should have a method to combine first name and last name" do
		author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
		expect(author.name).to eq('Alan Turing')
	end

	it "should not allow an author without a last name" do
		author = Author.new
		author.last_name = ''
		author.valid?
		expect(author.errors[:last_name]).to include("can't be blank")

		author.last_name = 'Turing'
		author.valid?
		expect(author.errors[:last_name]).to_not include("can't be blank")
	end
end