class AddUsersToSeen < ActiveRecord::Migration[7.0]
  def change
    add_column :seens, :user_id, :integer
    add_column :seens, :other_user_id, :integer
  end
end
