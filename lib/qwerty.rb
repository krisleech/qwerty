require "qwerty/engine"

module Qwerty
  class << self

    # Provides configurability to Qwerty
    # * admin_title: The title shown in the admin UI
    def options
      @options ||= {
        :admin_title => 'Qwerty CMS'
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
