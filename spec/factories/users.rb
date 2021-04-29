FactoryBot.define do
  factory :user, aliases: [:author, :commenter]  do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { '123fenix' }
  end
end
