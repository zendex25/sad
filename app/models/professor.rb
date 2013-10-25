class Professor < ActiveRecord::Base
	has_many :schedules

	belongs_to :department
	belongs_to :user

	has_paper_trail

	validates :lname, :fname, :presence => true

def procon
  	[lname, fname].join(', ')
  end

end
