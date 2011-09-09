class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :permalink
      t.string :title
      t.text   :body
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth, :default => 0
      t.integer :position
      t.integer :node_id
      t.timestamps
    end
  end
end
