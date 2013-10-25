class AddDaysSchedulesJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :days_schedules, :id => false do |t|
  		t.column :schedule_id,	:integer,	:null => false
  		t.column :day_id,		:integer,	:null => false
  	end
  	add_index :days_schedules, [:schedule_id]
  end


  def self.down
  	remove_index :days_schedules, [:schedule_id]
  	drop_table :days_schedules
  end
end
