module Qwerty
  class ViewGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def generate_view(document)
      destination_root = Rails.root
      template 'show.html.erb', "app/views/cms/#{document.node.ancestry.gsub('/root/', '').gsub('/', '.')}.html.erb", :document => document
    end
  end
end
