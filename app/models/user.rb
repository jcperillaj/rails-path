class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followers, :class_name => 'Follower', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, :class_name => 'Follower', foreign_key: 'followed_id', dependent: :destroy
  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
end
