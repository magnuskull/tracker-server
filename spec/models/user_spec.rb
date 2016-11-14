RSpec.describe User do
  describe "attributes" do
    it { is_expected.to have_attribute :username }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :username }
    it { FactoryGirl.create(:user); is_expected.to validate_uniqueness_of(:username).case_insensitive }
  end

  describe "relations" do
    it { is_expected.to have_many :timelines }
    it { is_expected.to have_many(:timeline_entries).through(:timelines) }
  end

end
