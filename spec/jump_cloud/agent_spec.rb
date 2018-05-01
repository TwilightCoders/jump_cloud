RSpec.describe JumpCloud::Agent do
  it "parses config" do
    expect(JumpCloud::Agent.config['systemKey']).to_not be_nil
  end
end
