class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :work_id
      t.string :title
      t.string :long_title
      t.integer :date
      t.timestamps
    end
  end
end
