class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.text :challenge
      t.integer :no_in_series
      t.integer :level
      t.text :test_assertions
      t.string :test_url
      t.string :video_explanation_url

      t.timestamps
    end
  end
end
