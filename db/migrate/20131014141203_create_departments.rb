class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :desc
      t.references :chair, index: true

      t.timestamps
    end
  end
end
