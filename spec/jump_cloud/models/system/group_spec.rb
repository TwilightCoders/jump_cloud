RSpec.describe JC::System::Group do

  it "Create a new System Group" do
    g = JumpCloud::System::Group.create(name: 'foo-to-delete')
    expect(g).to_not be_nil
    g = JumpCloud::System::Group.find(g.id)
    expect(g.name).to eq('foo-to-delete')
    g.destroy
  end

  it "Update a System Group" do
    g = JumpCloud::System::Group.create(name: 'foo-to-update')
    g.name = 'foo-to-delete'
    g.save
    g = JumpCloud::System::Group.find(g.id)
    expect(g.name).to eq('foo-to-delete')
    g.destroy
  end

  it "Delete a System Group" do
    g = JumpCloud::System::Group.create(name: 'foo-to-delete')
    g.destroy
  end

  it "List all System Groups" do
    system_groups = JumpCloud::System::Group.all.fetch
    expect(system_groups.count).to eq(4)
  end

  it "View an individual System Group details" do
    g = JumpCloud::System::Group.find('5a989c8145886d7d22e12a82')
    expect(g.name).to eq('foo-1-keep')

  end

end
