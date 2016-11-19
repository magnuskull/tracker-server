module V1
  class TimelineEntryResource < BaseResource

    attribute :value

    has_one :timeline
    has_one :user

    class << self
      def creatable_fields(context)
        super - [:user]
      end
      def updatable_fields(context)
        createable_fields(context)
      end
    end

    def fetchable_fields
      super
    end
  end
end
