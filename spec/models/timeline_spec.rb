RSpec.describe Timeline do
  describe "attributes" do
    it { is_expected.to have_attribute :name }
    it { is_expected.to have_attribute :question }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :user }
  end

  describe "relations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :timeline_entries }
    it { is_expected.to have_many(:numeric_entries).through(:timeline_entries).source(:entry) }
  end
end
