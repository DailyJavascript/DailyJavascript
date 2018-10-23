class User < ApplicationRecord
require 'securerandom'

def self.createEmailVerificationCode
	evc = SecureRandom.hex(18)
	u = User.find_by(email_verification_code: evc)
	while u.present?
		evc = SecureRandom.hex(18)
		u = User.find_by(email_verification_code: evc)
	end
	return evc
end

end
