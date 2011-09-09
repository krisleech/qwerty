class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :position
      t.integer :depth, :default => 0
      t.timestamps
    end
  end
end
