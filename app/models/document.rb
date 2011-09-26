class Document < ActiveRecord::Base
  belongs_to :node
  has_many :settings, :through => :node, :class_name => 'NodeSetting'

  validates_presence_of :title
  validates_presence_of :published_at, :if => proc { |d| d.published? }
  validates_uniqueness_of :permalink

  acts_as_nested_set :dependent => :destroy
  acts_as_list :scope => [ :parent_id, :node_id ]

  image_accessor :image

  default_scope :order => 'position ASC'
  
  scope :by_node, lambda { |node| where(:node_id => node.id) }
  scope :public, where(:published => true)

  before_save :set_summary, :set_meta_fields
  before_validation :set_published_at, :set_permalink

  delegate :get, :to => :node

  def node_name
    node.name
  end
  
  def image?
    !image.nil?
  end

  private

  def set_summary
    self.summary = Sanitize.clean(self.body.to(400)) if self.summary.blank? && !self.body.blank?
  end

  def set_published_at
    self.published_at = Date.today if published? && published_at.blank?
  end

  def set_meta_fields
    self.meta_title = title if published? && meta_title.blank?
    self.meta_description = summary if published? && meta_description.blank?
  end

  def set_permalink
    self.permalink = [ (self.root? ? '' : parent.permalink), self.title.parameterize('_') ].join('/') unless self.title.blank?
  end
end
