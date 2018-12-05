class CreateRefCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :ref_codes do |t|
      t.string :refcode
      t.text :refcode_url
      t.string :recipient_name
      t.text :recipient_url
      t.string :recipient_email
      t.text :email_content
      t.boolean :email_sent
      
      t.timestamps
    end
  end
end
