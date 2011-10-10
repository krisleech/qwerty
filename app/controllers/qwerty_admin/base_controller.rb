class QwertyAdmin::BaseController < InheritedResources::Base

  unless Qwerty.options[:admin_autherization].nil? 
    include Qwerty.options[:admin_autherization]
    before_filter :autherize
  end

  layout Qwerty.options[:admin_layout] unless Qwerty.options[:admin_layout].nil?
end
