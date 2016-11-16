module V1
  RSpec.describe UserResource do

    let :creatable_fields do
      [:username].sort
    end

    subject do
      described_class.new User.new, {}
    end

    it "has the expected createable attributes" do
      expect(described_class.creatable_fields({}).sort).to eq creatable_fields
    end

    it "has the expected updatable attributes" do
      expect(described_class.updatable_fields({}).sort).to eq creatable_fields
    end

    it "has the expected fetchable attributes" do
      expect(subject.fetchable_fields.sort).to eq (creatable_fields + [:timelines, :id, :created_at, :updated_at]).sort
    end
  end
end
