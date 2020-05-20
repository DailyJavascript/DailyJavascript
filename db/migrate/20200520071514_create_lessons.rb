class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :topic
      t.integer :duration
      t.text :details

      t.timestamps
    end
  end
end
