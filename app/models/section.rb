class Section
  include Mongoid::Document
  
  field :heading
  field :body
  field :position, :type => Integer
  
  embedded_in :post, :inverse_of => :sections
  
  validates :heading, :presence => true
  validates :body, :presence => true
  validates :position, :presence => true,
                       :numericality => { :greater_than => 0}
end
