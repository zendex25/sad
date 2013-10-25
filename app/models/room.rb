class Room < ActiveRecord::Base
	has_many :schedules

	has_paper_trail

	validates :name, :presence => true
end
