class Snippet
  include Mongoid::Document
  field :caption
  field :content
  field :language, :default => "ruby"
   
  embedded_in :section, :inverse_of => :snippet
  
  validates :caption, :presence => true
  validates :content, :presence => true

  def post_sequence
    section.post.sequence if section.post
  end
end
