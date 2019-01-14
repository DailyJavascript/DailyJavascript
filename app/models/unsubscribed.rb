class Unsubscribed < ApplicationRecord
has_many :user_challenges, foreign_key: "user_id"
has_one :subscription, foreign_key: "user_id"
has_one :visit, foreign_key: "user_id"
has_one :visitor_activity, through: :visit, foreign_key: "user_id"

end
