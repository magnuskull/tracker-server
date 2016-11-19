RSpec.describe TimelineEntry do
 describe "attributes" do
   it { is_expected.to have_attribute :value }
 end

 describe "validations" do
   it { is_expected.to validate_presence_of :value }
   it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5) }
   it { is_expected.to validate_presence_of :timeline }
 end

 describe "relations" do
   it { is_expected.to belong_to :timeline }
   it { is_expected.to have_one(:user).through(:timeline) }
 end
end
