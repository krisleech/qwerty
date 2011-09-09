class CreateNodeSettings < ActiveRecord::Migration
  def change
    create_table :node_settings do |t|
      t.string :key
      t.string :value
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth, :default => 0
      t.integer :node_id
      t.timestamps
    end
  end
end
