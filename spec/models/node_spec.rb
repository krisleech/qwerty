require 'spec_helper'

describe Node do
  let!(:root_node) { create(:node, :name => 'root') }
  let(:level1_node) { create(:node, :parent => root_node) }
  
  it "does not create document if it is root node" do
    root_node.reload.documents.count.should == 0
  end
  
  it "creates document if it descends from root node" do
    node = create(:node, :name => 'TestNode', :parent => root_node)
    node.reload.documents.count.should == 1
    document = node.documents.first
    document.title.should == 'Testnode'
  end
  
  it "does not create document if it does not descend from root node" do
    node = create(:node, :parent => level1_node)
    node.reload.documents.count.should == 0
  end
end
