class CreateRefCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :ref_codes do |t|
      t.string :refcode
      t.text :refcode_url
      t.text :destination_url
      t.string :destination_name

      t.timestamps
    end
  end
end
