class CreateSentences < ActiveRecord::Migration[7.0]
  def change
    create_table :sentences do |t|
      t.text :text, null: false

      t.timestamps
    end
  end
end
