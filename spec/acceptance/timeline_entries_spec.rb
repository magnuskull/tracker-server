require 'rspec_api_documentation_helper'

RSpec.resource "Timeline entries" do
  header "Content-Type", "application/vnd.api+json"

  shared_context "timeline_entry parameters" do
    parameter "type", <<-DESC, required: true
      The type of resource. Must be 'timeline_entries'.
    DESC

    let "type" do
      "timeline_entries"
    end

    parameter "value", <<-DESC, scope: :attributes, required: true
      The value of the timeline_entry.
    DESC

    parameter "timeline", <<-DESC, scope: :relationships, required: true
      The timeline the entry belongs to.
    DESC
  end

  post "/v1/timeline-entries" do
    include_context "timeline_entry parameters"

    let! :persisted_timeline do
      FactoryGirl.create(:timeline)
    end

    let "timeline" do
      {
        data: {
          type: "timelines",
          id: persisted_timeline.id.to_s
        }
      }
    end

    let "value" do
      3
    end

    example_request "POST /v1/timeline-entries" do
      expect(status).to eq 201
    end
  end

  get "/v1/timeline-entries/:id" do
    let! :persisted_timeline_entry do
      FactoryGirl.create(:timeline_entry)
    end

    let :id do
      persisted_timeline_entry.id.to_s
    end

    example_request "GET /v1/timeline-entries/:id" do
      expect(status).to eq 200
    end
  end

  patch "/v1/timeline-entries/:timeline_entry_id" do
    include_context "timeline_entry parameters"

    let! :persisted_timeline_entry do
      FactoryGirl.create(:timeline_entry)
    end

    let "timeline_entry_id" do
      persisted_timeline_entry.id.to_s
    end

    parameter "id", <<-DESC, required: true
      The id of the timeline_entry.
    DESC

    let :id do
      persisted_timeline_entry.id.to_s
    end

    let "value" do
      2
    end

    example_request "PATCH /v1/timeline-entries/:id" do
      expect(status).to eq 200
      timeline_entry = JSON.parse(response_body)
      expect(timeline_entry["data"]["attributes"]["value"]).to eq send(:value)
    end
  end

  get "/v1/timeline-entries" do
    before do
      2.times do
        FactoryGirl.create(:timeline_entry)
      end
    end

    example_request "GET /v1/timeline-entries" do
      expect(status).to eq 200
      timeline_entries = JSON.parse(response_body)
      expect(timeline_entries["data"].size).to eq 2
    end
  end

  delete "/v1/timeline-entries/:timeline_entry_id" do
    let! :persisted_timeline_entry do
      FactoryGirl.create(:timeline_entry)
    end

    let "timeline_entry_id" do
      persisted_timeline_entry.id.to_s
    end

    example_request "DELETE /v1/timeline-entries/:id" do
      expect(status).to eq 204
    end
  end

end
