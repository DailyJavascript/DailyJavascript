class CreateUserChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_challenges do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.boolean :emailed
      t.datetime :date_sent
      t.boolean :ran_tests
      t.boolean :saw_video

      t.timestamps
    end
  end
end
