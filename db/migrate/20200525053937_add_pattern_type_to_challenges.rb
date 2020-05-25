class AddPatternTypeToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :pattern_type, :string
  end
end
