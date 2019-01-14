class VisitorActivity < ApplicationRecord
	belongs_to :visit
	belongs_to :unsubscribed, primary_key: "user_id", foreign_key: "user_id"
	belongs_to :user, through: :visit
end
