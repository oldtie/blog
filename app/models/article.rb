class Article < ActiveRecord::Base
  validates :title, :presence => true 
  validates :body, :presence => true 
 
  belongs_to :user 
  has_and_belongs_to_many :categories
  has_many :comments
  
  scope :published, where("articles.published_at IS NOT NULL") 
  scope :draft, where("articles.published_at IS NULL") 
  scope :nice, where("articles.love_id > 10")
  scope :zhai, where("articles.from_url!=''")
  scope :blog, where("articles.from_url==''")
  scope :recent, lambda { published.where("articles.published_at > ?",  1.week.ago.to_date)} 
  
  def published?
  	published_at.present?
  end
  
  def owned_by?(owner) 
   return false unless owner.is_a? User 
   user == owner 
  end 
  
  def is_zhai?
   return from_url=="" ? false : true
  end
  
  def short_url
  	from_url.index(/\w\//) ? from_url.slice(0,1+from_url.index(/\w\//))	: from_url
  end
end
