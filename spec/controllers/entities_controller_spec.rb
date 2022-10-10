require 'rails_helper'

RSpec.describe EntitiesController do
  describe 'POST create' do
    let(:empty_sentence) { create(:sentence) }
    let(:sentence) { create(:sentence, :with_entity) }
    let(:entity_type) { create(:entity_type) }

    it 'creates a new entity with a new type' do
      post :create, params: {
        entity: {
          word_start_index: 2,
          word_end_index: 2,
          sentence_id: sentence.id,
          entity_type_attributes: {
            text: 'MONEY',
            color: '#ff8585'
          },
        }
      }
      expect(response).to redirect_to(sentence_path(sentence))
      expect(flash[:notice]).to eq('Tag was successfully created.')
      expect(EntityType.last).to have_attributes(
        text: 'MONEY',
        color: '#ff8585'
      )
      expect(Entity.last).to have_attributes(
        word_start_index: 2,
        word_end_index: 2,
        sentence_id: sentence.id,
        entity_type_id: EntityType.last.id
      )
    end

    it 'assigns an existing sentence' do
      post :create, params: {
        entity: {
          word_start_index: 2,
          word_end_index: 2,
          sentence_id: sentence.id,
          entity_type_id: entity_type.id,
        }
      }
      expect(response).to redirect_to(sentence_path(sentence))
      expect(flash[:notice]).to eq('Tag was successfully created.')
      expect(Entity.last).to have_attributes(
        word_start_index: 2,
        word_end_index: 2,
        sentence_id: sentence.id,
        entity_type_id: entity_type.id
      )
    end

    it 'fails to create an overlapping entity' do
      create(
        :entity,
        sentence: sentence,
        word_start_index: 0,
        word_end_index: 0
      )

      expect {
        post :create, params: {
          entity: {
            word_start_index: 0,
            word_end_index: 0,
            sentence_id: sentence.id,
            entity_type_attributes: {
              text: 'MONEY',
              color: '#ff8585'
            },
          }
        }
      }.to change(Entity, :count).by(0)
      .and change(EntityType, :count).by(0)

      expect(response).to redirect_to(sentence_path(sentence))
      expect(flash[:error]).to eq('There was a problem creating your tag: Tag overlaps with another tag.')
    end

    it 'fails to create an empty entity type' do
      expect {
        post :create, params: {
          entity: {
            word_start_index: 0,
            word_end_index: 0,
            sentence_id: empty_sentence.id,
            entity_type_attributes: {
              text: '',
              color: '#ff8585'
            },
          }
        }
      }.to change(Entity, :count).by(0)
      .and change(EntityType, :count).by(0)

      expect(response).to redirect_to(sentence_path(empty_sentence))
      expect(flash[:error]).to eq('There was a problem creating your tag: Entity type text can\'t be blank.')
    end
  end
end