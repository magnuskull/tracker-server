require 'rspec_api_documentation_helper'

RSpec.resource "Timelines" do
  header "Content-Type", "application/vnd.api+json"

  shared_context "timeline parameters" do
    parameter "type", <<-DESC, required: true
      The type of resource. Must be 'timelines'.
    DESC

    let "type" do
      "timelines"
    end

    parameter "name", <<-DESC, scope: :attributes, required: true
      The name of the timeline.
    DESC

    parameter "question", <<-DESC, scope: :attributes, required: true
      A question asking what to track, e.g. 'How are you now?'.
    DESC

    parameter "user", <<-DESC, scope: :relationships, required: true
      The user the timeline belongs to.
    DESC
  end

  post "/v1/timelines" do
    include_context "timeline parameters"

    let! :persisted_user do
      FactoryGirl.create(:user)
    end

    let "user" do
      {
        data: {
          type: "users",
          id: persisted_user.id.to_s
        }
      }
    end

    let "name" do
      "Timeline1"
    end

    let "question" do
      "How are you now?"
    end

    example_request "POST /v1/timelines/" do
      expect(status).to eq 201
    end
  end

  get "/v1/timelines/:id" do
    let! :persisted_timeline do
      FactoryGirl.create(:timeline)
    end

    let :id do
      persisted_timeline.id.to_s
    end

    example_request "GET /v1/timelines/:id" do
      expect(status).to eq 200
    end
  end

  patch "/v1/timelines/:timeline_id" do
    include_context "timeline parameters"

    let! :persisted_timeline do
      FactoryGirl.create(:timeline)
    end

    let "timeline_id" do
      persisted_timeline.id.to_s
    end

    parameter "id", <<-DESC, required: true
      The id of the timeline.
    DESC

    let :id do
      persisted_timeline.id.to_s
    end

    let "name" do
      "Timeline edited"
    end

    example_request "PATCH /v1/timelines/:id" do
      expect(status).to eq 200
      timeline = JSON.parse(response_body)
      expect(timeline["data"]["attributes"]["name"]).to eq send(:name)
    end
  end

  get "/v1/timelines/" do
    before do
      2.times do
        FactoryGirl.create(:timeline)
      end
    end

    example_request "GET /v1/timelines" do
      expect(status).to eq 200
      timelines = JSON.parse(response_body)
      expect(timelines["data"].size).to eq 2
    end
  end

  delete "/v1/timelines/:timeline_id" do
    let! :persisted_timeline do
      FactoryGirl.create(:timeline)
    end

    let "timeline_id" do
      persisted_timeline.id.to_s
    end

    example_request "DELETE /v1/timelines/:id" do
      expect(status).to eq 204
    end
  end

end
