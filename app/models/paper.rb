class Paper < ActiveRecord::Base
	validates :title, :venue, :year, presence: true
end
