class CreateUserRefCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ref_codes do |t|
      t.bigint :user_id
      t.bigint :ref_code_id

      t.timestamps
    end
  end
end
