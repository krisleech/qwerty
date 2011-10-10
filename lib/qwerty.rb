# Dependencies
require 'nested_set'
require 'acts_as_list'
require "inherited_resources"
require "simple_form"
require "jquery-rails"
require "sanitize"
require "dragonfly"
require "faker"

# Qwerty
require "qwerty/engine"
require "qwerty/allow_auth"
require "qwerty/deny_auth"
require "qwerty/lipsum"

module Qwerty
  class << self

    # Provides configurability to Qwerty
    #
    # * admin_title: The title shown in the admin UI
    #
    # * admin_authentication: Module which is mixed in to Qwerty admin 
    # controllers, it must have a method called 'autherize', which is called 
    # from a before_filter
    #
    # * authentication: Module which is mixed in to public facing Qwerty, works
    # in the same way as admin_authentication. Usually this will not need 
    # changing as you will allow unrestricted access to your CMS pages.
    #
    # * admin_layout: The layout to use for all Qwerty's admin controllers,
    # set o nil to use Rails default layout
    #
    # * layout: The layout to use for Qwerty's public facing controllers, set
    # to nil to use the Rails default layout
    
    def options
      @options ||= {
        :admin_title => 'Qwerty CMS',
        :autherization => Qwerty::AllowAuth,
        :admin_autherization => Qwerty::AllowAuth,
        :admin_layout => nil,
        :layout => nil
      }
    end

    # Allow for easier settings of multiple options in an initalizer
    # Qwerty.configure do | config |
    #   config.options[:admin_title] = 'Administration'
    # end
    def configure
      yield(self) if block_given?
    end
  end
end
