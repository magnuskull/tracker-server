require 'rspec_api_documentation_helper'

RSpec.resource "Users" do
  header "Content-Type", "application/vnd.api+json"

  shared_context "user parameters" do
    parameter "type", <<-DESC, required: true
      The type of resource. Must be 'users'.
    DESC

    let "type" do
      "users"
    end

    parameter "username", <<-DESC, scope: :attributes, required: true
      The username of the user.
    DESC
  end

  post "/v1/users" do
    include_context "user parameters"

    let "username" do
      "mkull"
    end

    example_request "POST /v1/users" do
      expect(status).to eq  201
    end
  end

  get "/v1/users/:id" do
    let! :persisted_user do
      FactoryGirl.create(:user)
    end
    let :id do
      persisted_user.id.to_s
    end

    example_request "GET /v1/users/:id" do
      expect(status).to eq 200
    end
  end

  patch "/v1/users/:user_id" do
    let! :persisted_user do
      FactoryGirl.create(:user)
    end

    let "user_id" do
      persisted_user.id.to_s
    end

    parameter "id", <<-DESC, required: true
      The id of the user.
    DESC

    include_context "user parameters"

    let :id do
      persisted_user.id.to_s
    end

    let "username" do
      "mkull1"
    end

    example_request "PATCH /v1/users/:id" do
      expect(status).to eq 200
      user = JSON.parse(response_body)
      expect(user["data"]["attributes"]["username"]).to eq send(:username)
    end
  end

  get "/v1/users" do
    before do
      2.times do
        FactoryGirl.create(:user)
      end
    end

    example_request "GET /v1/users" do
      expect(status).to eq 200
      users = JSON.parse(response_body)
      expect(users["data"].size).to eq 2
    end
  end

  delete "/v1/users/:user_id" do
    let! :persisted_user do
      FactoryGirl.create(:user)
    end

    let "user_id" do
      persisted_user.id.to_s
    end

    example "DELETE /v1/users/:id" do
      expect{do_request}.to raise_error(ActionController::RoutingError)
    end
  end
end
