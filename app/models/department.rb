class Department < ActiveRecord::Base
  belongs_to :chair

  has_paper_trail

  validates :name, :desc, :presence => true
end
