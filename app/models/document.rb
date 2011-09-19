class Document < ActiveRecord::Base
  belongs_to :node
  has_many :settings, :through => :node, :class_name => 'NodeSetting'

  validates_presence_of :title

  acts_as_nested_set :dependent => :destroy
  acts_as_list :scope => [ :parent_id, :node_id ]

  default_scope :order => 'position ASC'
  
  scope :by_node, lambda { |node| where(:node_id => node.id) }

  before_save :set_summary

  delegate :get, :to => :node

  def node_name
    node.name
  end

  private

  def set_summary
    self.summary = Sanitize.clean(self.body.to(400)) if self.summary.blank? && !self.body.blank?
  end
end
