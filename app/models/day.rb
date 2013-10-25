class Day < ActiveRecord::Base

has_many :schedules
default_scope { order(:id)}

has_paper_trail

validates :name, :desc, :presence => true

end