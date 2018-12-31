class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.string :ref_code
      t.string :cookie
      t.bigint :user_id
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
