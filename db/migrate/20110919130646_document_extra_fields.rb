class DocumentExtraFields < ActiveRecord::Migration
  def up
    add_column :documents, :summary, :text
    add_column :documents, :published, :boolean, :default => false
    add_column :documents, :url, :string
    add_column :documents, :image_uid, :string
    add_column :documents, :image_name, :string
  end

  def down
    remove_column :documents, :summary
    remove_column :documents, :published
    remove_column :documents, :url
    remove_column :documents, :image_uid
    remove_column :documents, :image_name
  end
end
