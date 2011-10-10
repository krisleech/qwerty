class QwertyAdmin::BaseController < InheritedResources::Base
  # Module which has a method called 'autherize', this is called from a before_filter below
  include Qwerty.options[:admin_autherization]

  before_filter :autherize

  layout Qwerty.options[:admin_layout] unless Qwerty.options[:admin_layout].nil?
end
