class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :plain_text
      t.integer :chapter_id
      t.integer :character_id
      t.integer :work_id
      t.timestamps
    end
  end
end
