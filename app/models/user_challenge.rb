class UserChallenge < ApplicationRecord
belongs_to :user
belongs_to :unsubscribed, foreign_key: "user_id"

end
