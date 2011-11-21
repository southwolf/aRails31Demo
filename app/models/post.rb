class Post
  include Mongoid::Document
  field :title, :type => String
  field :sequence, :type => Integer
  field :description, :type => String
end
