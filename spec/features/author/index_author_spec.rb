require 'rails_helper'

describe "Author index page", type: :feature do
 
	it "should render the author index page without error" do
		visit author_index_path
	end
end