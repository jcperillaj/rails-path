require 'rails_helper'

RSpec.describe Follower, type: :model do
  context 'Validations' do
    context 'Presence' do
      it { should validate_length_of(:follower) }
      it { should validate_presence_of(:followed) }
    end
  end

  context 'Associations' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end

  context 'Database Columns' do
    it { should have_db_column(:follower_id).of_type(:integer) }
    it { should have_db_column(:followed_id).of_type(:integer) }
  end
end
