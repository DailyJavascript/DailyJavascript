class AddIsChallengeToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :is_challenge, :boolean
  end
end
