require 'rails_helper'

RSpec.describe Sentence, type: :model do
  it { should have_db_column(:text).of_type(:text).with_options(null: false) }
  it { should validate_presence_of(:text) }

  it { should have_many(:entities).dependent(:destroy) }

  describe '#entities_by_word_index' do
    let(:sentence) { create(:sentence) }
    let!(:entity) { create(:entity, sentence: sentence, word_start_index: 1, word_end_index: 2) }

    it 'returns the corresponding entity for each word in the sentence' do
      expect(sentence.reload.entities_by_word_index[0]).to be_nil
      expect(sentence.entities_by_word_index[1]).to eq entity
      expect(sentence.entities_by_word_index[2]).to eq entity
      expect(sentence.entities_by_word_index[3]).to be_nil
    end
  end

  describe 'before_save' do
    let(:sentence) { create(:sentence, text: '   A new sentence.  ') }
    it 'strips the text' do
      expect(sentence.text).to eq 'A new sentence.'
    end
  end
end