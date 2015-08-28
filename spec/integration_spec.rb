require('spec_helper')

describe('the band path', :type => :feature) do
  it('display the bandlist on the front page') do
    visit('/')
    expect(page).to have_content('Bandlist 2015')
  end
end
