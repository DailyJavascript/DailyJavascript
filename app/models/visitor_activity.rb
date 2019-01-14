class VisitorActivity < ApplicationRecord
	belongs_to :visit
	belongs_to :unsubscribed, foreign_key: "user_id"

end
