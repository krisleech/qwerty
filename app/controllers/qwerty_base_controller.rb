class QwertyBaseController < ApplicationController

  unless Qwerty.options[:autherization].nil? 
    include Qwerty.options[:autherization]
    before_filter :autherize
  end

  layout Qwerty.options[:layout] unless Qwerty.options[:layout].nil?
end
