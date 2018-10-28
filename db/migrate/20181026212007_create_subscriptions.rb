class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.string :subscription_id
      t.string :status
      t.string :plan
      t.timestamp :date_last_charged
      t.string :payment_provider
      t.string :payment_provider_user_id
      t.string :most_recent_transaction_confirmation_number
      t.text :payment_history

      t.timestamps
    end
  end
end
