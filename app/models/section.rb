class Section < ActiveRecord::Base
  belongs_to :department

  has_many :schedules

  validates :name, :department_id, :yearlevel, :presence => true

  def seccon
  	[name, department.name, yearlevel].join
  end


end
