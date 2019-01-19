class Visit < ApplicationRecord
	belongs_to :user
	has_one :visitor_activity
	has_one :unsubscribed, primary_key: "user_id", foreign_key: "user_id"
end
