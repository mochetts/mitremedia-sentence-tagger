class Entity < ApplicationRecord
  belongs_to :sentence
  belongs_to :entity_type

  accepts_nested_attributes_for :entity_type

  validate :not_overlapping, on: :create

  def text
    sentence.text.split(' ')[word_start_index..word_end_index].join(' ')
  end

  private

  def not_overlapping
    overlapping_entity = sentence.entities.find { |e| overlaps_with?(e) }
    errors.add(:tag, "overlaps with another tag") unless overlapping_entity.nil?
  end

  def overlaps_with?(other_entity)
    other_entity.id != id && (
      (word_start_index..word_end_index).to_a & (other_entity.word_start_index..other_entity.word_end_index).to_a
    ).present?
  end
end
