class QwertyBaseController < ApplicationController
  # Module which has a method called 'autherize', this is called from a before_filter below
  include Qwerty.options[:autherization]

  before_filter :autherize
end
