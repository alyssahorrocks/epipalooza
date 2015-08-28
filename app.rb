require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#------------------------BAND PATH----------------#
get('/') do
  @bands = Band.all()
  erb(:index)
end

get('/bands') do
  erb(:band_form)
end

post('/bands') do
  name = params.fetch('band_name')
  @band = Band.new({:name => name})
  if @band.save()
    redirect('/')
  else
    erb(:errors)
  end
end

post('/bands') do
  name = params.fetch("name")
  recipe = Recipe.create({:name => name, :instruction => nil})

end

get('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  @venues = Venue.all()
  erb(:band)
end

patch('/bands/edit/:id') do
  id = params.fetch('id')
  new_name = params.fetch('update_name')
  @band = Band.find(id)
  @band.update({:name => new_name})
  redirect("/bands/#{@band.id()}")
end

post('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  venue_id = Venue.find(params.fetch('venue_ids'))
  @band.venues().push(venue_id)
  redirect("/bands/#{@band.id()}")
end

delete('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  @band.destroy()
  @band.venues.destroy()
  redirect('/')
end

#--------------------VENUE PATH-------------------------#

get('/venues') do
  @venues = Venue.all()
  erb(:venue_form)
end

post('/venues') do
  name = params.fetch('venue_name')
  @venue = Venue.find_or_create_by({:name => name})
  redirect('/venues')
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch('id'))
  erb(:venue)
end

delete('/venues/:id') do
  @venue = Venue.find(params.fetch('id'))
  @venue.destroy()
  redirect('/venues')
end
