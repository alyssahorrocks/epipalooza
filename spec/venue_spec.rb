require('spec_helper')

describe(Venue) do
  it { should validate_presence_of(:name) }

  it("capitalize any input") do
    venue = Venue.create({:name => "mAin sTage"})
    expect(venue.name()).to(eq("Main Stage"))
  end

  describe('#bands') do
    it { should have_and_belong_to_many(:bands) }
  end
end
