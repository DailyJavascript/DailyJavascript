class AddPricePlanIdToUnsubscribeds < ActiveRecord::Migration[5.1]
  def change
    add_column :unsubscribeds, :price_plan_id, :bigint
  end
end
