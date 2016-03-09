class Article < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: {minimum: 3, maximum: 140}
  validates :text, presence: true

  def subject
    title
  end

  def last_comment
    comments.last
  end
end
