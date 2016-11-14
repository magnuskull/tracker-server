module V1
  class UserResource < BaseResource

    attribute :username

    def fetchable_fields
      super
    end

  end
end
