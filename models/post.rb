class Post
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :content, Text
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize
DataMapper.auto_upgrade!
