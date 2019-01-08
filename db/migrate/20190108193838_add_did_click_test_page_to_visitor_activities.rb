class AddDidClickTestPageToVisitorActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :visitor_activities, :did_click_test_page, :boolean
  end
end
