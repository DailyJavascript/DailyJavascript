class UsersController < ApplicationController

	def index
		render 'index'
	end

	def preflight
		if ((request.headers[:HTTP_ORIGIN].to_s == "https://www.dailyjavascript.io") || (request.headers[:HTTP_ORIGIN].to_s == "http://www.dailyjavascript.io") || (request.headers[:HTTP_ORIGIN].to_s == "http://dailyjavascript.io"))
			render plain: "proceed"
		else 
			render plain: "stop"
		end
	end

	def create
		t = DateTime.now
		u = User.new(email: params[:email], email_verified: false, email_verification_code: nil, unsubscribe_code: nil, date_joined: t, membership_level: params[:membership_level], date_current_membership_level: t, membership_level_history: nil)
		mc = params[:membership_code].to_s
		subscription_result = nil
		output = "bad"
		if u.save
			result = 1
			u.reload
			u.email_verification_code = User.createEmailVerificationCode
			u.unsubscribe_code = User.createUnsubscribeCode
			membership_level_history = {}
			membership_level_history["level"] = params[:membership_level].to_s
			membership_level_history["date"] = t
			u.membership_level_history = JSON.generate(membership_level_history)
			if mc == "2"
				subscription_result = Subscription.subscription_enroll(params[:stripe_token_id], params[:email], params[:membership_level])
				if subscription_result[0] == 1
					u.create_subscription(subscription_id: subscription_result[1], status: "active", plan: params[:membership_level], date_last_charged: DateTime.now, payment_provider: "stripe", payment_provider_user_id: subscription_result[2])
				else
					result = 2
				end
			end
			if (mc == "2" && result == 2)
				u.delete
			else
				u.save
				UserMailer.welcome_email(u.email, u.id).deliver_now
				output = "good"
			end
			if (!params["visitID"].nil?)
				v = Visit.find(params["visitID"])
				v.signed_up = true
				v.date_signed_up = DateTime.now
				if (u.present?)
					v.user_id = u.id
				end
				v.save
			end
		end
		render plain: output
	end

	def unsubscribe
		@unsubscribe_result = 0
		user = User.find_by(email: params[:email].to_s, unsubscribe_code: params[:unsubscribe_code].to_s)
		if (user.present? && (user.membership_level.to_s == "free"))
			user_challenges = UserChallenge.where(user_id: user.id)
			if user_challenges.present?
				user_challenges.delete_all
			end
			Unsubscribed.create(email: user.email, email_verified: user.email_verified, email_verification_code: user.email_verification_code, unsubscribe_code: user.unsubscribe_code, date_joined: user.date_joined, membership_level: user.membership_level, date_current_membership_level: user.date_current_membership_level, membership_level_history: user.membership_level_history, active: user.active) 
			user.delete 
			@unsubscribe_result = 1
		end
	end


	def show_subscriptions
		@users = User.order(:id)
		@visits = Visit.order(:id)
		@ref_codes = RefCode.order(:id)
	end

	def visit
		rc = nil
		if (!params["refcode"].nil?)
			rc = params["refcode"]
		end
		v = Visit.create(ref_code: rc, date_first_visited: DateTime.now, signed_up: false)
		render plain: v.id
	end

end