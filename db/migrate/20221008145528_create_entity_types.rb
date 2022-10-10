class CreateEntityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_types do |t|
      t.string :color, null: false
      t.string :text, null: false

      t.index %i[text], unique: true

      t.timestamps
    end
  end
end
