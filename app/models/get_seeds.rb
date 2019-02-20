class GetSeeds < ApplicationRecord


	def self.get_refcode_seeds
		RefCode.order(:id).each do |x|
			puts "RefCode.create(id: "+x.id.inspect+", ref_code:"+x.ref_code.inspect+", ref_code_url:"+x.ref_code_url.inspect+", recipient_name:"+x.recipient_name.inspect+", recipient_url:"+x.recipient_url.inspect+")"
		end
	end

	def self.get_challenge_seeds
		Challenge.order(:id).each do |x|
			puts "Challenge.create(id: "+x.id.inspect+", challenge:"+x.challenge.inspect+", challenge_no:"+x.challenge_no.inspect+", level:"+x.level.inspect+", test_assertions:"+x.test_assertions.inspect+", test_url:"+x.test_url.inspect+", video_explanation_url:"+x.video_explanation_url.inspect+", is_challenge:"+x.is_challenge.inspect+")"
		end
	end

	def self.get_user_seeds
		User.order(:id).each do |x|
			puts "User.create(id: "+x.id.inspect+", email:"+x.email.inspect+", email_verified:"+x.email_verified.inspect+", email_verification_code:"+x.email_verification_code.inspect+", unsubscribe_code:"+x.unsubscribe_code.inspect+", date_joined:"+x.date_joined.inspect+", membership_level:"+x.membership_level.inspect+", date_current_membership_level:"+x.date_current_membership_level.inspect+", membership_level_history:"+x.membership_level_history.inspect+", active:"+x.active.inspect+", price_plan_id:"+x.price_plan_id.inspect+")"
		end
	end

	def self.get_userchallenge_seeds
		UserChallenge.order(:id).each do |x|
			puts "UserChallenge.create(id: "+x.id.inspect+", user_id:"+x.user_id.inspect+", challenge_id:"+x.challenge_id.inspect+", emailed:"+x.emailed.inspect+", date_sent:"+x.date_sent.inspect+", ran_tests:"+x.ran_tests.inspect+", saw_video:"+x.saw_video.inspect+")"
		end
	end

	def self.get_unsubscribed_seeds
		Unsubscribed.order(:id).each do |x|
			puts "Unsubscribed.create(id: "+x.id.inspect+", user_id: "+x.user_id.inspect+", email:"+x.email.inspect+", email_verified:"+x.email_verified.inspect+", email_verification_code:"+x.email_verification_code.inspect+", unsubscribe_code:"+x.unsubscribe_code.inspect+", date_joined:"+x.date_joined.inspect+", membership_level:"+x.membership_level.inspect+", date_current_membership_level:"+x.date_current_membership_level.inspect+", membership_level_history:"+x.membership_level_history.inspect+", active:"+x.active.inspect+", price_plan_id:"+x.price_plan_id.inspect+")"
		end
	end

	def self.get_all_seeds
		self.get_refcode_seeds
		puts
		self.get_challenge_seeds
		puts
		self.get_user_seeds
		puts
		self.get_userchallenge_seeds
		puts
		self.get_unsubscribed_seeds
	end
end