class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.belongs_to :department, index: true
      t.integer :yearlevel

      t.timestamps
    end
  end
end
