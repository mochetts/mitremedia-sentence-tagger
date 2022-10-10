require 'rails_helper'

RSpec.describe EntityType, type: :model do
  subject { create(:entity_type) }

  it { should have_db_column(:text).of_type(:string).with_options(null: false) }
  it { should have_db_column(:color).of_type(:string).with_options(null: false) }
  it { should have_db_index(%i[text]).unique(true) }

  it { should validate_presence_of(:text) }
  it { should validate_uniqueness_of(:text) }
  it { should validate_presence_of(:color) }
end