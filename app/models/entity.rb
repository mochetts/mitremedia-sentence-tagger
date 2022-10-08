class Entity < ApplicationRecord
  belongs_to :sentence
  belongs_to :entity_type

  accepts_nested_attributes_for :entity_type

  def text
    sentence.text.split(' ')[word_start_index..word_end_index].join(' ')
  end
end
