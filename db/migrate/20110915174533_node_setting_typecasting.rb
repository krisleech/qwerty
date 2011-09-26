class NodeSettingTypecasting < ActiveRecord::Migration
  def up
    add_column :node_settings, :value_klass, :string
  end

  def down
    remove_column :node_settings, :value_klass
  end
end
