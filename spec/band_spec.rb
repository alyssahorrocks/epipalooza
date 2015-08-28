require('spec_helper')

describe(Band) do
  it { should validate_presence_of(:name) }

  it("capitalize any input") do
    band = Band.create({:name => "TAYLOR SWIFT"})
    expect(band.name()).to(eq("Taylor swift"))
  end

  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end

end
