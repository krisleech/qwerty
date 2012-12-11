require 'spec_helper'

feature "View Document" do
  background do
    create(:document, :title => 'home', :body => 'This is home page')
    create(:document, :title => 'about', :body => 'This is about page')
  end

  scenario "View Single Document" do
    visit "/about"
    page.should have_content('This is about page')
  end
  
  scenario "View document at /" do
    visit "/"
    page.should have_content('This is home page')
  end
  
  scenario "Not existed document" do
    expect { visit "/non-existed" }.to raise_exception(ActiveRecord::RecordNotFound)
  end
end
