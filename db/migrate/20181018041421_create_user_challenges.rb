class CreateUserChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_challenges do |t|
      t.bigint :user_id
      t.bigint :challenge_id
      t.boolean :emailed
      t.datetime :date_sent
      t.boolean :ran_tests
      t.boolean :saw_video

      t.timestamps
    end
  end
end
