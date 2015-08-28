require('spec_helper')

describe('the venue path', :type => :feature) do
  it('allow a user to add a venue') do
    visit('/')
    click_link('Add a Venue')
    fill_in('venue_name', :with => 'Main stage')
    click_button('Add Venue')
    expect(page).to have_content('Main stage')
  end

end
