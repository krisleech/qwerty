class QwertyAdmin::BaseController < ApplicationController
  # Module which has a method called 'autherize', this is called from a before_filter below
  include Qwerty.options[:autherization]

  before_filter :autherize

  layout 'qwerty_admin'
end
