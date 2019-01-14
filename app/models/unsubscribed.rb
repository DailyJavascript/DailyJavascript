class Unsubscribed < ApplicationRecord
has_many :user_challenges, primary_key: "user_id", foreign_key: "user_id"
has_one :subscription, primary_key: "user_id", foreign_key: "user_id"
has_one :visit, primary_key: "user_id", foreign_key: "user_id"
has_one :visitor_activity, through: :visit, primary_key: "user_id", foreign_key: "user_id"

end
