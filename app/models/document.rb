class Document < ActiveRecord::Base
  belongs_to :node
  has_many :settings, :through => :node, :class_name => 'NodeSetting'

  acts_as_nested_set
  acts_as_list :scope => :parent_id
end
