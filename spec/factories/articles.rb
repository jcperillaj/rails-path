FactoryBot.define do
  factory :article do
    title { 'Article title' }
    body { 'Body of the article' }
    status { Visible::VALID_STATUSES.first }
    author  { User.first }
  end
end
