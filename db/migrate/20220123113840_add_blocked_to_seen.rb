class AddBlockedToSeen < ActiveRecord::Migration[7.0]
  def change
    add_column :seens, :blocked,:boolean, default: false
  end


end
