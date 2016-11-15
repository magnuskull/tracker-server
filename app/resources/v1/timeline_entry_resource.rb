module V1
  class TimelineEntryResource < BaseResource

    attribute :value

    has_one :timeline

    def fetchable_fields
      super
    end
  end
end
