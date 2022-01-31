class CreateSeens < ActiveRecord::Migration[7.0]
  def change
    create_table :seens do |t|
      t.datetime :last_seen
      t.timestamps
    end
  end
end
