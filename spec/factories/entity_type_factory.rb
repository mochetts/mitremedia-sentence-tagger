# This will guess the User class
FactoryBot.define do
  factory :entity_type do
    text { Faker::Name.unique.name }
    color { "#00FF00" }
  end
end