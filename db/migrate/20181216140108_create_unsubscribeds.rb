class CreateUnsubscribeds < ActiveRecord::Migration[5.1]
  def change
    create_table :unsubscribeds do |t|
      t.bigint :user_id
      t.string :email
      t.boolean :email_verified
      t.string :email_verification_code
      t.string :unsubscribe_code
      t.datetime :date_joined
      t.string :membership_level
      t.datetime :date_current_membership_level
      t.text :membership_level_history
      t.boolean :active
      t.bigint :price_plan_id
      
      t.timestamps
    end
  end
end
