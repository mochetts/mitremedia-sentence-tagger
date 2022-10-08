class CreateEntityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_types do |t|
      t.string :color
      t.string :text

      t.timestamps
    end
  end
end