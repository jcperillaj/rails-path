require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Validations' do
    context 'Presence' do
      it { should validate_length_of(:body) }
      it { should validate_presence_of(:status) }
      it { should validate_presence_of(:article) }
      it { should validate_presence_of(:commenter) }
    end

    context 'Acceptance' do
      it { should validate_inclusion_of(:status).in_array(Visible::VALID_STATUSES) }
    end
  end

  context 'Associations' do
    it { should belong_to(:commenter) }
    it { should belong_to(:article) }
  end

  context 'Database Columns' do
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:status).of_type(:string) }
    it { should have_db_column(:article_id).of_type(:integer) }
    it { should have_db_column(:author_id).of_type(:integer) }
  end
end
