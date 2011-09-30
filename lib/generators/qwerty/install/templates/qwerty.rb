Qwerty.configure do | config |
  # config.options[:admin_title] = 'Qwerty'

  # Qwerty does not include autherisation/authentication, it hooks in to your
  # applications own choices. This way you can use authlogic, devise, cancan or 
  # any other system.
  #
  # Create a module with a autherize method, the autherize method is called from
  # a before_filter in every one of Qwerty's admin controllers.
  #
  # Example: 
  # module Qwerty
  #   module DeviseAuth
  #     def autherize
  #       # Delegate to Devise
  #       authenticate_user! 
  #       raise 'You must be an admin' unless current_user.admin?
  #     end
  #   end
  # end
  #
  # config.options[:admin_autherization] = Qwerty::DeviseAuth
  #
  # Qwerty comes bundled with two Auth stratagies AllowAuth and DenyAuth.
  # As the names suggest AllowAuth allows everything and DenyAuth allows
  # nothing.
  #
  # You can also autherize a user for regular CMS pages, for example if some
  # pages need to be private. By default anyone is allowed to view all
  # non-admin pages.
  #
  # config.options[:autherization] = Qwerty::AllowAuth
end

