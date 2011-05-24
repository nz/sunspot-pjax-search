class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :char_id
      t.string :name
      t.string :abbrev
      t.string :description
      t.integer :speech_count
      t.integer :work_id
      t.timestamps
    end
  end
end
