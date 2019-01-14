class Visit < ApplicationRecord
	has_one :visitor_activity
	belongs_to :user
	belongs_to :unsubscribed, primary_key: "user_id", foreign_key: "user_id"
end
