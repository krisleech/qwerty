module Qwerty
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc 'Install Qwerty in to your Rails application'

    invoke 'qwerty:copy_views'

    def copy_sitemap_config
      template 'sitemap.rb', 'config/sitemap.rb'
    end

    def copy_initializers
      template 'qwerty.rb', 'config/initializers/qwerty.rb'
    end

    def remove_index_html
      remove_file 'public/index.html'
    end

    def show_readme
      readme 'README'
    end
  end
end
