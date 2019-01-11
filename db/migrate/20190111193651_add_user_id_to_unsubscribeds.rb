class AddUserIdToUnsubscribeds < ActiveRecord::Migration[5.1]
  def change
    add_column :unsubscribeds, :user_id, :bigint
  end
end
