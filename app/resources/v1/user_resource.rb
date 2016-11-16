module V1
  class UserResource < BaseResource

    attribute :username

    has_many :timelines

    class << self
      def creatable_fields(context)
        super - [:timelines]
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
