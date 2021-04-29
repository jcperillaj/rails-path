class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :commenter, :class_name => 'User', foreign_key: 'author_id'

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :commenter, presence: true
  validates :article, presence: true
  validates :status, presence: true
end
