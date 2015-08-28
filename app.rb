require("bundler/setup")
Bundler.require(:default)

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
  @band = Band.create({:name => name})
  redirect('/')
end

get('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  erb(:band)
end
