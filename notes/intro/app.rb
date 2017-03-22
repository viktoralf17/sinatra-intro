require 'sinatra'

get '/' do
  @user = User.first
  @names = ['pepito', 'pepita', 'ozu']
  erb :index
end


def method_name()

end
