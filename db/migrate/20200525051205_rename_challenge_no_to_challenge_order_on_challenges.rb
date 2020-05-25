class RenameChallengeNoToChallengeOrderOnChallenges < ActiveRecord::Migration[5.1]
  def change
    rename_column :challenges, :challenge_no, :challenge_order
  end
end
