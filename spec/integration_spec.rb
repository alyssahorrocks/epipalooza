require('spec_helper')

describe('the band path', :type => :feature) do
  it('display the bandlist on the front page') do
    visit('/')
    expect(page).to have_content('Bandlist 2015')
  end

  it('allow user to add a band') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'My Chemical Romance')
    click_button('Add Band')
    expect(page).to have_content('My Chemical Romance')
  end

  it('allow user to access information for a specific band') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'System of a Down')
    click_button('Add Band')
    click_link('System of a Down')
    expect(page).to have_content('System of a Down')
  end
end
