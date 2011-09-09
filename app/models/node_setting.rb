class NodeSetting < ActiveRecord::Base
  belongs_to :node
  acts_as_nested_set
end
