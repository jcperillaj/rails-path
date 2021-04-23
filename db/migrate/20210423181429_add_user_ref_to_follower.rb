class AddUserRefToFollower < ActiveRecord::Migration[6.1]
  def change
    add_reference :followers, :follower, null: false, foreign_key: {to_table: 'users'}
    add_reference :followers, :followed, null: false, foreign_key: {to_table: 'users'}
  end
end
