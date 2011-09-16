module Qwerty
  module DenyAuth
    def autherize
      raise 'Authentication failed'
    end
  end
end
