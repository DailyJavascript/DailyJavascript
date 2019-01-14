class VisitorActivity < ApplicationRecord
	belongs_to :visit
	has_one :unsubscribed, through: :visit, primary_key: "user_id", foreign_key: "user_id"
	has_one :user, through: :visit
end
