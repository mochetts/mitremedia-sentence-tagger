require 'rails_helper'

RSpec.describe EntityType, type: :model do
  subject { create(:entity_type) }

  it { should have_db_column(:text).of_type(:string).with_options(null: false) }
  it { should have_db_column(:color).of_type(:string).with_options(null: false) }
  it { should have_db_index(%i[text]).unique(true) }

  it { should validate_presence_of(:text) }
  it { should validate_uniqueness_of(:text) }
  it { should validate_presence_of(:color) }

  describe '#text_color' do
    it 'returns white for dark colors' do
      dark_entity_type = create(:entity_type, color: '#3e1313')
      expect(dark_entity_type.text_color).to eq 'white'
    end

    it 'returns black for light colors' do
      light_entity_type = create(:entity_type, color: '#7feceb')
      expect(light_entity_type.text_color).to eq 'black'
    end
  end
end