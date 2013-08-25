require './bootloader'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

map "/public" do
  run Rack::Directory.new("./public")
end

# map sinatr apps here
#map '/posts' do
#  run PostsApp.new
#end

map '/' do
  run HomeController.new
end
