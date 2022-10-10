require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject { create(:entity) }

  it { should have_db_column(:word_start_index).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:word_end_index).of_type(:integer).with_options(null: false) }

  it { should belong_to(:sentence).dependent(:destroy) }
  it { should belong_to(:entity_type).dependent(:destroy) }

  it { should have_db_index(:entity_type_id) }
  it { should have_db_index(:sentence_id) }

  describe 'validates not_overlapping' do
    let(:entity) { create(:entity) }
    let(:sentence) { entity.sentence }
    let(:overlapping_entity) { build(:entity, sentence: sentence.reload) }
    let(:non_overlapping_entity) { build(:entity, sentence: sentence.reload, word_start_index: 2, word_end_index: 2) }

    it 'fails to save overlapping entities' do
      expect(overlapping_entity).not_to be_valid
      expect(overlapping_entity.errors.messages[:tag].first).to eq 'overlaps with another tag'
    end

    it 'does not fail with non overlapping entities' do
      expect(non_overlapping_entity).to be_valid
    end
  end

  describe 'text' do
    let(:sentence) { create(:sentence, text: 'A not so long sentence' )}
    let(:entity) { create(:entity, sentence: sentence, word_start_index: 1, word_end_index: 2) }

    it 'returns the text of this entity' do
      expect(entity.text).to eq 'not so'
    end
  end
end