module V1
  class TimelineResource < BaseResource

    attribute :name

    has_one :user

    def fetchable_fields
      super
    end
  end
end
