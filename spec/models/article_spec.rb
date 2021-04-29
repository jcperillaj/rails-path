require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validations' do
    context 'Presence' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:body) }
      it { should validate_length_of(:body).is_at_least(10) }
      it { should validate_presence_of(:status)}
      it { should validate_presence_of(:author) }
    end

    context 'Acceptance' do
      it { should validate_inclusion_of(:status).in_array(Visible::VALID_STATUSES) }
    end
  end

  context 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:comments).dependent(:destroy)}
  end

  context 'Database Columns' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:status).of_type(:string) }
    it { should have_db_column(:author_id).of_type(:integer) }
  end
end
