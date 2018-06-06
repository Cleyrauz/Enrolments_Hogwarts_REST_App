require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/student' do
  @students = Student.all()
  erb(:index)
end

get '/student/new' do
  @houses = House.all()
  erb(:new)
end

get '/student/:id' do
  @houses = House.all()
  @student = Student.find(params[:id])
  erb(:show)
end

post '/student' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get '/student/:id/edit' do
  @houses = House.all
  @student = Student.find(params['id'])
  erb(:edit)
end

post '/student/:id' do
  student = Student.new(params)
  student.update
  redirect to "/student/#{params['id']}"
end

post '/student/:id/delete' do
  student = Student.find(params['id'])
  student.delete
  redirect to '/student'
end
