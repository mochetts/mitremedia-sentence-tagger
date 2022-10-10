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
  end
end