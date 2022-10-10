class EntityType < ApplicationRecord
  validates :text, presence: true, uniqueness: true
  validates :color, presence: true
end
