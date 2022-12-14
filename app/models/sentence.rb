class Sentence < ApplicationRecord
  has_many :entities, dependent: :destroy

  before_save -> { self.text = self.text.strip }

  validates :text, presence: true

  def entities_by_word_index
    @entities_by_word_index ||= entities.inject({}) do |hash, entity|
      (entity.word_start_index..entity.word_end_index).each do |word_index|
        hash[word_index] = entity
      end
      hash
    end
  end
end
