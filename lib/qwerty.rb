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
    # * admin_autherization: Module which is mixed in to Qwerty admin 
    # controllers, it must have a method called 'autherize', which is called 
    # from a before_filter. Set to nil to turn autherization off.
    #
    # * autherization: Module which is mixed in to public facing Qwerty, works
    # in the same way as admin_authentication. Usually this will be left as nil
    # to allow anybody access to CMS pages.
    #
    # Note: All Qwerty controllers inherit from ApplicationController, so your
    # autherize method will have access to its private methods e.g current_user.
    #
    # * admin_layout: The layout to use for all Qwerty's admin controllers,
    # set o nil to use Rails default layout
    #
    # * layout: The layout to use for Qwerty's public facing controllers, set
    # to nil to use the Rails default layout
    #
    # * admin_route_namespace: The namespace for the admin controllers, you may
    # wish to change this to '/admin' if you have other controllers in this
    # namespace and you want consistant URL's. Note: if you change this your
    # views will still reside in 'views/qwerty_admin'.
    
    def options
      @options ||= {
        :admin_title => 'Qwerty CMS',
        :autherization => nil,
        :admin_autherization => nil,
        :admin_layout => 'qwerty_admin',
        :layout => nil,
        :admin_route_namespace => '/qwerty_admin'
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
