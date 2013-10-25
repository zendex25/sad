class ChangeTimeFormatInSchedule < ActiveRecord::Migration
def self.up
   change_column :schedules, :start_time, :time
   change_column :schedules, :finish_time, :time
  end

  def self.down
   change_column :schedules, :start_time, :string
   change_column :schedules, :finish_time, :string
  end
end
