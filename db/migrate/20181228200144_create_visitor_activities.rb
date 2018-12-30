class CreateVisitorActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :visitor_activities do |t|
      t.integer :visit_id
      t.string :section_ids
      t.boolean :did_click_input
      t.text :email_input_value
      t.boolean :did_click_payment
      t.string :plan

      t.timestamps
    end
  end
end
