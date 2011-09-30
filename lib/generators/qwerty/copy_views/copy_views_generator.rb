module Qwerty
  class CopyViewsGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../../', __FILE__)
    desc 'Copy views for customising'

    def copy_views
      directory 'app/views', 'app/views', :recursive => true
    end
  end
end
