# This will guess the User class
FactoryBot.define do
  factory :entity do
    sentence { create(:sentence) }
    entity_type { create(:entity_type) }
    word_start_index { 0 }
    word_end_index { 0 }
  end
end