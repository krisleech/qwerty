class Document < ActiveRecord::Base
  belongs_to :node
  has_many :settings, :through => :node, :class_name => 'NodeSetting'

  acts_as_nested_set :dependent => :destroy
  acts_as_list :scope => :parent_id

  default_scope :order => 'position ASC'
  
  scope :by_node, lambda { |node| where(:node_id => node.id) }

  def node_name
    node.name
  end
end
