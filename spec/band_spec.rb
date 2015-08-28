require('spec_helper')

describe(Band) do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it("set the input to capitalized words") do
    band = Band.create({:name => "tAylor SWIFT"})
    expect(band.name()).to(eq("Taylor Swift"))
  end

  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end

end
