class AddUserIdToChairs < ActiveRecord::Migration
  def change
  	add_column :chairs, :user_id, :integer
  end
end
