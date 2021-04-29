require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    context 'Presence' do
      it { should validate_length_of(:email) }
    end

  end

  context 'Associations' do
    it { should have_many(:followers).dependent(:destroy) }
    it { should have_many(:followed_users).dependent(:destroy) }
    it { should have_many(:articles).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  context 'Database Columns' do
    it { should have_db_column(:email).of_type(:string) }
  end

  context 'Factory' do
    subject {build(:user)}
    it { should be_valid }
  end
end
