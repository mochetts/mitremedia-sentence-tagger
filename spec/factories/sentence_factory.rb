# This will guess the User class
FactoryBot.define do
  factory :sentence do
    text { 'Apple is looking at buying U.K. startup for $1 billion.' }
  end

  trait :with_entity do
    after(:create) do |sentence|
      create(:entity, sentence: sentence)
    end
  end
end