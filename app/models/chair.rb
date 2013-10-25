class Chair < ActiveRecord::Base
  belongs_to :department

  has_paper_trail

  validates :lname, :fname, :presence => true
end
