require 'rails_helper'

describe "Papermodel", type: :model do
	it "should not validate without a title" do
		paper = Paper.new(title: nil, venue: "mind49: 433-460", year: 1950)
		expect(paper.valid?).to eq(false)
	end
end
