class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :description
      t.integer :chapter
      t.integer :section
      t.integer :chapter_id
      t.integer :work_id
      t.timestamps
    end
  end
end
