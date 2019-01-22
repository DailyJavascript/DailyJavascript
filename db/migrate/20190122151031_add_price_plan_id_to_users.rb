class AddPricePlanIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :price_plan_id, :bigint
  end
end
