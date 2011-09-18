class Node
  module Sugar
    extend ActiveSupport::Concern

    included do
      PerPageOff = 10000
    end

    def pagination_off!
      setting = get(:per_page) || settings.new(:key => 'per_page')
      setting.value = PerPageOff
      setting.save!
    end

    module ClassMethods
    end

    private
  end
end
