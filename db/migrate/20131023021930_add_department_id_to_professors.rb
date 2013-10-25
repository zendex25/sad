class AddDepartmentIdToProfessors < ActiveRecord::Migration
  def change
  	add_column :professors, :department_id, :integer
  	add_column :professors, :user_id, :integer
  end
end
