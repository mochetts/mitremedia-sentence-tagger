class EntityType < ApplicationRecord
  validates :text, presence: true
  validates :color, presence: true
end
