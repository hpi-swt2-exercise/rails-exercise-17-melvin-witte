require 'rails_helper'

describe "Papermodel", type: :model do
	it "should not validate without a title, venue and year" do
		paper = Paper.new(title: nil, venue: "mind49: 433-460", year: 1950)
		expect(paper.valid?).to eq(false)
		paper.title = "very good"
		paper.venue = nil
		expect(paper.valid?).to eq(false)
		paper.venue = 'also good'
		paper.year = nil
		expect(paper.valid?).to eq(false)
		paper.year = 1950
		expect(paper.valid?).to eq(true)
	end

	it "should not validate without an integer as a year" do
		paper = FactoryGirl.create(:paper)
		paper.year = "Schinken"
		expect(paper.valid?).to eq(false)
	end

	it "should have no or many authors associated with it" do
		paper = FactoryGirl.create(:paper)
		authors = paper.authors
	end
end
