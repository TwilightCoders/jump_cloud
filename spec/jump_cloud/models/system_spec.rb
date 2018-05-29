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

  it "Add system to a group" do
    systems = JumpCloud::System.all.fetch
    s = systems.first

    groups = JumpCloud::System::Group.all.fetch
    g = groups.first
    g.add(s)
  end

end
