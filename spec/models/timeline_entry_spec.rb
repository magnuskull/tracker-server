RSpec.describe TimelineEntry do

 describe "relations" do
   it { is_expected.to belong_to :timeline }
   it { is_expected.to belong_to :entry }
 end
 describe "validations" do
   it { is_expected.to validate_presence_of :timeline }
   it { is_expected.to validate_presence_of :entry }
   it { is_expected.to validate_presence_of :entry_type }
 end

end
