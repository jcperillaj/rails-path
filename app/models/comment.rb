class Comment < ApplicationRecord
  belongs_to :article
  belongts_to :commenter, :class_name => 'User'

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
