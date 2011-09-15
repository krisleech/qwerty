class NodeAncestry < ActiveRecord::Migration
  def up
    add_column :nodes, :ancestry, :string
  end

  def down
    remove_column :nodes, :ancestry
  end
end
