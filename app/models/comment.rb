class Comment < ActiveRecord::Base
  belongs_to :article
  validates :body, presence: true, length: {minimum: 3, maximum: 4000}
end
