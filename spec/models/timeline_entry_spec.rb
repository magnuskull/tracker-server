RSpec.describe TimelineEntry do

 describe "relations" do
   it { is_expected.to belong_to :timeline }
   it { is_expected.to belong_to :entry }
 end

end
