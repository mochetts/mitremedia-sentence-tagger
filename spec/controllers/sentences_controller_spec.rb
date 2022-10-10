require 'rails_helper'

RSpec.describe SentencesController do
  describe 'GET index' do
    let(:sentences) { create_list(:sentence, 5) }

    it 'assigns @sentences' do
      get :index
      expect(assigns(:sentences)).to eq(sentences)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    it 'creates a sentence' do
      post :create, params: { sentence: { text: 'A not so long sentence' }}
      expect(response).to redirect_to(sentences_path)
      expect(flash[:notice]).to eq('Sentence was successfully created.')
      expect(Sentence.last).to have_attributes(text: 'A not so long sentence')
    end

    it 'fails to create an empty sentence' do
      post :create, params: { sentence: { text: '' }}
      expect(response).to redirect_to(sentences_path)
      expect(flash[:error]).to eq('There was a problem creating your sentence: Text can\'t be blank.')
      expect(Sentence.count).to be_zero
    end
  end

  describe 'GET show' do
    let(:sentence) { create(:sentence, :with_entity) }

    it 'creates a sentence' do
      get :show, params: { id: sentence.id }
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get :show, params: { id: sentence.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the sentence and the new entity' do
      get :show, params: { id: sentence.id }
      expect(assigns(:sentence)).to eq(sentence)
      expect(assigns(:new_entity)).to have_attributes(
        sentence_id: sentence.id,
        entity_type_id: nil,
      )
    end
  end
end