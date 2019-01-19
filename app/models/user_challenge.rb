class UserChallenge < ApplicationRecord
belongs_to :user
#has_one :unsubscribed, primary_key: "user_id", foreign_key: "user_id"

end
