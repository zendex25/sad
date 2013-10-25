class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :lname
      t.string :fname
      t.string :mi
      t.references :department, index: true

      t.timestamps
    end
  end
end
