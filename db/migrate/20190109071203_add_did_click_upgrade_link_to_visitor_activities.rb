class AddDidClickUpgradeLinkToVisitorActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :visitor_activities, :did_click_upgrade_link, :boolean
  end
end
