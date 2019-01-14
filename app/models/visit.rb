class Visit < ApplicationRecord
	has_one :visitor_activity
	belongs_to :user
	belongs_to :unsubscribed, foreign_key: "user_id"
end
