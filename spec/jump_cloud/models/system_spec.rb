RSpec.describe JumpCloud::System do
  it "GET list" do
    systems = JumpCloud::System.all.fetch
  end
  it "GET list" do
    systems = JumpCloud::System.all.fetch
  end
  it "GET groups" do
    systems = JumpCloud::System::Group.all.fetch
  end

end
