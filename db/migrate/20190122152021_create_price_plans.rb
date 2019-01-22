class CreatePricePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :price_plans do |t|
      t.string :name
      t.decimal :price1
      t.string :price1_stripe_product_code
      t.decimal :price2
      t.string :price2_stripe_product_code
      t.string :url_code

      t.timestamps
    end
  end
end
