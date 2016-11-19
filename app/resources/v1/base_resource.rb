module V1
  class BaseResource < JSONAPI::Resource
    abstract

    attribute :created_at

    class << self
      def creatable_fields(context)
        super - [:created_at, :id]
      end
      alias_method :updatable_fields, :creatable_fields
    end

    def fetchable_fields
      super + [:updated_at]
    end
  end
end
