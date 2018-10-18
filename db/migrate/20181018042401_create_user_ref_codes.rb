class CreateUserRefCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ref_codes do |t|
      t.integer :user_id
      t.integer :ref_code_id

      t.timestamps
    end
  end
end
