class Qwerty::CreateDocumentViewsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc 'Create a example views for a documents'

    def generate_views(node = Sitemap.root)
      node.children.each do | node |
        generate_view(node)
        generate_views(node) unless node.leaf?
      end
    end

    private

    def generate_view(node)
      destination_root = Rails.root
      template 'show.html.erb', "app/views/cms/#{node.ancestry.gsub('/root/', '').gsub('/', '.')}.html.erb", :node => node
    end
end
