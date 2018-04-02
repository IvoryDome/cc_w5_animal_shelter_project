require('sinatra')
require('sinatra/contrib/all')
require_relative('..models/animal')
require_relative('..models/owner')

get '/animals' do
  @animals = Animal.all
  erb(:index)
end

get '/animals/new' do
  @animals = Animal.all
  erb(:new)
end

post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

get '/animals/:id' do
  @animal = Animal.find(params['id'])
  erb(:show)
end

get '/animals/:id/edit' do
  @animals = Animal.all
  @animal = Animal.find(params['id'])
  erb(:edit)
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/animals/#{params['id']}"
end

post '/aninals/:id/delete' do
  animal = Animal.find(params['id'])
  animal.delete
  redirect to '/animals'
end
