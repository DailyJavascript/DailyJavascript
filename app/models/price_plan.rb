class PricePlan < ApplicationRecord


	def self.mail_special_offer_emails
		pp = PricePlan.find_by(name: "$4_special_offer")
		[151,152,158,159,161,163,166,167,169,170,172,8].each do |x|
			if User.where(id: x).present?
				UserMailer.special_offer_email(x, "$4_special_offer").deliver_now
				u = User.find(x).price_plan_id = pp.id
				u.save
			end
		end

		pp = PricePlan.find_by(name: "$3_special_offer")
		[115,116,117,118,119,127,128,129,133,150,171,160].each do |x|
			if User.where(id: x).present?
				UserMailer.special_offer_email(x, "$3_special_offer").deliver_now
				u = User.find(x).price_plan_id = pp.id
				u.save
			end
		end

		pp = PricePlan.find_by(name: "$2_special_offer")
		[87,88,89,91,92,96,102,103,107,108,114].each do |x|
			if User.where(id: x).present?
				UserMailer.special_offer_email(x, "$2_special_offer").deliver_now
				u = User.find(x).price_plan_id = pp.id
				u.save
			end
		end

		pp = PricePlan.find_by(name: "$1_special_offer")
		[46,56,62,63,67,69,73,74,76,86,175].each do |x|
			if User.where(id: x).present?
				UserMailer.special_offer_email(x, "$1_special_offer").deliver_now
				u = User.find(x).price_plan_id = pp.id
				u.save
			end
		end

	end

end
