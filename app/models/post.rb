class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :sequence, :type => Integer
  field :description
  
  default_scope order_by(:created_at => :desc)  
  
  validates :title, :presence => true
  validates :sequence, :presence => true,
                       :numericality => { :greater_than => 0 }
  validates :description, :presence => true
end
