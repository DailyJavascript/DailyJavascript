class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.bigint :user_id
      t.string :ref_code
      t.string :cookie
      t.datetime :date_first_visited
      t.boolean :signed_up
      t.datetime :date_signed_up
      t.boolean :signup_level
      t.string :ip_address
      t.boolean :from_blog

      t.timestamps
    end
  end
end
