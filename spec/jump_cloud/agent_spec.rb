RSpec.describe JumpCloud::Agent do
  it "parses existing config" do
    allow(JumpCloud::Agent).to receive(:config_file).and_return(Pathname.new(File.expand_path('../support/jcagent.conf', __dir__)))
    expect(JumpCloud::Agent.config['systemKey']).to eq('59762621ecab57e934afa759')
  end

  it "parses non-existant config" do
    JumpCloud::Agent.instance_variable_set(:@config, nil)

    expect{JumpCloud::Agent.config}.not_to raise_error
    expect(JumpCloud::Agent.config['systemKey']).to eq(nil)
  end
end
