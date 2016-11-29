RSpec.describe TextEntry do

  describe "attributes" do
    it { is_expected.to have_attribute :answer }
  end

  describe "relations" do
    it { is_expected.to have_one :timeline_entry }
    it { is_expected.to have_one(:timeline).through(:timeline_entry) }
  end

end
