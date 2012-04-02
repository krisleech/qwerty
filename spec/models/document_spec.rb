require 'spec_helper'

describe Document do
  describe '#title' do
    it 'validates presence of title' do
      document = build(:document, :title => '')
      document.should_not be_valid
      document.errors[:title].should include("can't be blank")
    end
  end
  
  describe '#published_at' do
    before(:each) { Timecop.freeze(Time.new(2012, 1, 1, 17, 0, 0)) }
    after(:each) { Timecop.return }
    
    it 'sets published_at when published is set true' do
      document = create(:document, :published => false)
      document.published_at.should == nil
      document.update_attributes(:published => true)
      document.published_at.should == Date.new(2012, 1, 1)
    end
    
    it 'keeps old published_at if published_at is set' do
      document = create(:document, :published => true)
      document.published_at.should == Date.new(2012, 1, 1)
      Timecop.travel(10.day.from_now)
      document.update_attributes(:title => 'new title', :published => true)
      document.published_at.should == Date.new(2012, 1, 1)
    end
  end
  
  describe '#summary' do
    it 'sets summary when meta_title blank' do
      document = create(:document, :published => true, :summary => '', :body => 'some document body here')
      document.meta_title.should_not be_blank
    end
  end
  
  describe '#meta_title' do
    it 'sets meta_title when meta_title blank' do
      document = create(:document, :published => true, :meta_title => '')
      document.meta_title.should_not be_blank
    end
  end
  
  describe '#meta_description' do
    it 'sets meta_description when meta_description blank' do
      document = create(:document, :published => true, :meta_description => '', :body => 'some document body here')
      document.meta_description.should_not be_blank
    end
  end
  
  describe '#permalink' do
    it 'sets permalink base on title' do
      document = create(:document, :title => 'some document title')
      document.permalink.should match(/some_document_title/)
    end
    
    it "sets permalink with parent's permalink as prefix'" do
      parent_document = create(:document, :title => 'parent doc')
      document = create(:document, :title => 'some document title', :parent => parent_document)
      document.permalink.start_with?(parent_document.permalink).should be_true
    end
  end
end
