class DocumentImageAlt < ActiveRecord::Migration
  def up
    add_column :documents, :image_alt, :string
  end

  def down
    add_column :documents, :image_alt
  end
end
