class Node
  module Sugar
    extend ActiveSupport::Concern

    included do
      PerPageOff = 10000
    end

    def pagination_off!
      settings.find_or_create_by_key('per_page') { |s| s.value = PerPageOff }
    end

    def undeletable!
      settings.find_or_create_by_key('can_delete') { |s| s.value = false }
    end

    module ClassMethods
    end
  end
end
