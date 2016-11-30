RSpec.describe Timeline do
  describe "attributes" do
    it { is_expected.to have_attribute :name }
    it { is_expected.to have_attribute :question }
    it { is_expected.to define_enum_for(:timeline_type).with([:Numeric, :Text]) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :timeline_type }
  end

  describe "relations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :timeline_entries }
    it { is_expected.to have_many(:numeric_entries).through(:timeline_entries).source(:entry) }
    it { is_expected.to have_many(:text_entries).through(:timeline_entries).source(:entry) }
  end
end
