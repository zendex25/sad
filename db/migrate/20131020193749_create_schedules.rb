class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :section, index: true
      t.references :subject, index: true
      t.string :start_time
      t.string :time
      t.string :finish_time
      t.string :time
      t.references :professor, index: true
      t.references :room, index: true
      t.references :day, index: true

      t.timestamps
    end
  end
end
