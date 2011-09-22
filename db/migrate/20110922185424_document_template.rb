class DocumentTemplate < ActiveRecord::Migration
  def up
    add_column :documents, :template, :string
  end

  def down
    remove_column :documents, :template, :string
  end
end
