class User < ApplicationRecord
require 'securerandom'

has_many :challenges
has_one :subscription

validates :email, uniqueness: true


def self.createEmailVerificationCode
	code = SecureRandom.hex(36)
	u = User.find_by(email_verification_code: code)
	while u.present?
		code = SecureRandom.hex(36)
		u = User.find_by(email_verification_code: code)
	end
	return code
end

def self.createUnsubscribeCode
	code = SecureRandom.hex(36)
	u = User.find_by(unsubscribe_code: code)
	while u.present?
		code = SecureRandom.hex(36)
		u = User.find_by(unsubscribe_code: code)
	end
	return code
end

end
