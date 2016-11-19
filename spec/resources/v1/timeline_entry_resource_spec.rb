module V1
  RSpec.describe TimelineEntryResource do

    let :creatable_fields do
      [:value, :timeline].sort
    end

    subject do
      described_class.new TimelineEntry.new, {}
    end

    it "has the expected createable attributes" do
      expect(described_class.creatable_fields({}).sort).to eq creatable_fields
    end

    it "has the expected updatable attributes" do
      expect(described_class.updatable_fields({}).sort).to eq creatable_fields
    end

    it "has the expected fetchable attributes" do
      expect(subject.fetchable_fields.sort).to eq (creatable_fields + [:user, :id, :created_at, :updated_at]).sort
    end

  end
end
