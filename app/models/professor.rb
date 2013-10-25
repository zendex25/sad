class Professor < ActiveRecord::Base
	has_many :schedules

	has_paper_trail

	validates :lname, :fname, :presence => true

def procon
  	[lname, fname].join(', ')
  end

end
