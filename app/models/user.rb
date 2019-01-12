class User < ApplicationRecord
require 'securerandom'
require 'mail'


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

def self.validate_email(email)
	begin
		a = Mail::Address.new(email)
	rescue Mail::Field::ParseError
		puts
		puts "bad email"
		puts
		return false
	else
		return true
	end
end

def self.get_email_address_only(email)
	a = Mail::Address.new(email)
	return a.address
end

end