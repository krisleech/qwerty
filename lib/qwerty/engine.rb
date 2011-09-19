module Qwerty
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
  end
end
