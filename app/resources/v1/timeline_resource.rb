module V1
  class TimelineResource < BaseResource

    attribute :name

    has_one :user

    has_many :timeline_entries

    class << self
      def creatable_fields(context)
        super - [:timeline_entries]
      end
      def updatable_fields(context)
        creatable_fields(context)
      end
    end

    def fetchable_fields
      super
    end
  end
end
