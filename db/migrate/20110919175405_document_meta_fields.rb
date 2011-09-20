class DocumentMetaFields < ActiveRecord::Migration
  def up
    add_column :documents, :published_at, :date
    add_column :documents, :meta_title, :string
    add_column :documents, :meta_description, :string
    add_column :documents, :meta_keywords, :string
  end

  def down
    remove_column :documents, :published_at
    remove_column :documents, :meta_title
    remove_column :documents, :meta_description
    remove_column :documents, :meta_keywords
  end
end
