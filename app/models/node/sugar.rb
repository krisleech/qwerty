class Node
  module Sugar
    extend ActiveSupport::Concern

    included do
      PerPageOff = 10000
    end

    def pagination_off!
      settings.find_or_create_by_key('per_page') { |s| s.value = PerPageOff }
    end

    def undeleteable!
      settings.find_or_create_by_key('can_delete') { |s| s.value = false }
    end

    def fields(config)
      settings.find_or_create_by_key('include_fields') { |s| s.value = config[:only] } if config[:only]
      settings.find_or_create_by_key('exclude_fields') { |s| s.value = config[:except] } if config[:except]
    end

    def fieldsets(config)
      settings.find_or_create_by_key('include_fieldsets') { |s| s.value = config[:only] } if config[:only]
      settings.find_or_create_by_key('exclude_fieldsets') { |s| s.value = config[:except] } if config[:except]
    end

    module ClassMethods
    end
  end
end
