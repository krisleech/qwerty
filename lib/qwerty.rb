require "qwerty/engine"
require "qwerty/allow_auth"
require "qwerty/deny_auth"

module Qwerty
  class << self

    # Provides configurability to Qwerty
    # * admin_title: The title shown in the admin UI
    # * authentication: Module which is mixed in to CMS controllers, it must have a method called 'autherize', which is called from a before_filter
    def options
      @options ||= {
        :admin_title => 'Qwerty CMS',
        :autherization => Qwerty::AllowAuth
      }
    end

    # Allow for easier settings of multiple options in an initalizer
    # Qwerty.configure do | config |
    #   config.admin_title = 'Administration'
    # end
    def configure
      yield(self) if block_given?
    end
  end
end
