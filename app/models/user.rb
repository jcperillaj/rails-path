class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followers, :class_name => 'Follower', foreign_key: 'followed'
  has_many :followed_users, :class_name => 'Follower', foreign_key: 'follower'
  has_many :articles, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
end
