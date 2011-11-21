class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :sequence, :type => Integer
  field :description
  
  embeds_many :sections
  accepts_nested_attributes_for :sections, :reject_if => lambda { |attr| attr['heading'].blank? && attr['body'].blank? }
  
  default_scope order_by(:created_at => :desc)  
  
  validates :title, :presence => true
  validates :sequence, :presence => true,
                       :numericality => { :greater_than => 0 }
  validates :description, :presence => true
  
  def build_section_and_snippet
    sections.build if sections.empty?
    sections.each{ |section| section.build_snippet if section.snippet.nil?}
  end
end
