require 'rails_helper'

RSpec.describe EntityType, type: :model do
  it { should have_db_column(:text).of_type(:string).with_options(null: false) }
  it { should have_db_column(:color).of_type(:string).with_options(null: false) }

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:color) }
end