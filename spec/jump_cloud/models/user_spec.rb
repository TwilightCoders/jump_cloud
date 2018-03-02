RSpec.describe JumpCloud::User do
  it "GET list" do
    users = JumpCloud::User.all.fetch
    expect(users.length).to eq(1)
  end

  it "GET specific" do
    user = JumpCloud::User.find('5a982b04bcd080497a24b477')
    expect(user.email).to eq('dale@twilightcoders.net')
  end

  it "GET search" do
    email = 'dale@twilightcoders.net'
    users = JumpCloud::User.where(email: email)
    user = users.first
    expect(users.count).to eq(1)
    expect(user.email).to eq(email)
  end

  it "GET systems" do
    user = JumpCloud::User.find('5a982b04bcd080497a24b477')
    systems = user.systems.fetch
    binding.pry
    expect(user.email).to eq('dale@twilightcoders.net')
  end

end
