class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.integer :word_start_index, null: false
      t.integer :word_end_index, null: false

      t.references :entity_type, null: false, foreign_key: true
      t.references :sentence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
