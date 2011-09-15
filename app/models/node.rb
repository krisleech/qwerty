class Node < ActiveRecord::Base
  has_many :documents, :dependent => :destroy
  has_many :settings, :class_name => 'NodeSetting', :dependent => :destroy

  acts_as_nested_set :dependent => :destroy
  acts_as_list :scope => :parent_id

  validates_presence_of :name, :ancestry
  validates_uniqueness_of :ancestry

  before_validation :set_ancestry

  # Add a child node and optionally pass a block which receives the child node
  def add(name, &block)
    new_node = self.children.create!(:name => name.to_s)
    yield(new_node) if block_given?
  end

  # Set the value for node settings
  def set(hash)
    hash.each do | key, value |
      setting = settings.find_by_key(key) || settings.new(:key => key)
      setting.value = value
      setting.save!
    end
  end

  # Get a value for a node setting
  def get(key)
    settings.find_by_key(key).try(:value)
  end

  def to_hash
    result = {}
    result[:name] = self.name
    result[:children] = self.children.collect { |c| c.to_hash } unless self.children.empty?
    result
  end

  private

  def set_ancestry
    self.ancestry = [self.parent.try(:ancestry), self.name].join('/') if new_record? || parent_id_changed?
  end
end
