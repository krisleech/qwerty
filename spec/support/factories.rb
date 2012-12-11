require 'factory_girl'

FactoryGirl.define do
  factory :document do
    node
    sequence(:title) { |n| "Document title #{n}" }
    published true
    body "Document body"
  end
  
  factory :node do
    sequence(:name) { |n| "Node#{n}" }
  end
  
  factory :node_setting do
    node
    sequence(:key) { |n| "node_setting_key_#{n}" }
    value_klass 'String'
    value 'Some Setting Value'
  end
end
