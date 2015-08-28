require('spec_helper')

describe('the venue path', :type => :feature) do
  it('allow a user to add a venue') do
    visit('/')
    click_link('Add or View a Venue')
    fill_in('venue_name', :with => 'Main stage')
    click_button('Add Venue')
    expect(page).to have_content('Main Stage')
  end

  it('allows a user to delete a venue') do
    visit('/')
    click_link('Add or View a Venue')
    fill_in('venue_name', :with => 'East stage')
    click_button('Add Venue')
    click_link('East Stage')
    click_button('Delete Venue')
    expect(page).not_to have_content('East Stage')
  end

  it('allow a user to see the bands playing at a specific venue') do
    visit('/')
    click_link('Add or View a Venue')
    fill_in('venue_name', :with => 'Karaoke stage')
    click_button('Add Venue')
    click_link('Karaoke Stage')
    expect(page).to have_content('Bands playing on the Karaoke Stage:')
  end

end
