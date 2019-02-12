class PricePlan < ApplicationRecord


def self.mail_special_offer_emails
	[8,175,160].each do |x|
		UserMailer.special_offer_email(x, "$4_special_offer").deliver_now
	end
	[8,175,160].each do |x|
		UserMailer.special_offer_email(x, "$3_special_offer").deliver_now
	end
	[8,175,160].each do |x|
		UserMailer.special_offer_email(x, "$2_special_offer").deliver_now
	end
	[8,175,160].each do |x|
		UserMailer.special_offer_email(x, "$1_special_offer").deliver_now
	end
end

end
