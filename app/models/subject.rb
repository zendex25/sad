class Subject < ActiveRecord::Base
  belongs_to :department

  has_paper_trail

  has_many :schedules

  validates :name, :desc, :units, :presence => true
end
