class UsersController < ApplicationController

	def index
		render 'index'
	end

	def preflight
		if ((request.headers[:HTTP_ORIGIN].to_s == "https://goofy-ride-78f322.netlify.com") || (request.headers[:HTTP_ORIGIN].to_s == "http://goofy-ride-78f322.netlify.com"))
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
		if mc == "2"
			subscription_result = Subscription.subscription_enroll(params[:stripe_token_id], params[:email], params[:plan])
		end
		if ((mc == "1" || (mc == "2" && subscription_result[0] == 1)) && u.save!)
			u.reload
			u.email_verification_code = User.createEmailVerificationCode
			u.unsubscribe_code = User.createUnsubscribeCode
			membership_level_history = {}
			membership_level_history["level"] = params[:membership_level].to_s
			membership_level_history["date"] = t
			u.membership_level_history = JSON.generate(membership_level_history)
			if mc == "2"
				u.create_subscription(subscription_id: subscription_result[1], status: "active", plan: params[:plan], date_last_charged: DateTime.now, payment_provider: "stripe", payment_provider_user_id: subscription_result[2])
			end
			u.save
			render plain: "good"
		else 
			render plain: "bad"
		end
	end

	def show_subscriptions
		@subs = Subscription.all
	end



end
