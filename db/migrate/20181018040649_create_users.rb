class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, index: {unique: true}
      t.boolean :email_verified
      t.string :email_verification_code
      t.string :unsubscribe_code
      t.datetime :date_joined
      t.string :membership_level
      t.datetime :date_current_membership_level
      t.text :membership_level_history
      t.boolean :active

      t.timestamps
    end
  end
end
