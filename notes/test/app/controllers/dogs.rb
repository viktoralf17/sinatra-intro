get '/' do
  @dogs = Dog.all
  @errors = params[:errors] ? JSON.parse(params[:errors]) : nil
  erb :index
end


get '/dogs/:id' do
  @dog = Dog.find(params[:id])
  erb :show
end

get '/dogs/:id/edit' do
  @dog = Dog.find(params[:id])
  erb :edit
end

patch '/dogs/:id' do
  dog = Dog.find_by(id: params[:id])
  if dog
    dog.update(name: params[:name], age: params[:age])
  end
  redirect "/dogs/#{dog.id}"
end

post '/dogs' do
  dog = Dog.new(name: params[:name], age: params[:age])
  if dog.save
    redirect '/'
  else
    @errors = dog.errors.full_messages
    # erb :index
    redirect "/?errors=#{JSON.generate(@errors)}"
  end
end
