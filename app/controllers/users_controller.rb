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

	def get_price
		response = "not found"
		if (!params["special_offer_code"].nil?)
			pp = PricePlan.find_by(url_code: params.permit(:special_offer_code)[:special_offer_code])
			if (pp.present?)
				response = pp.price1
			end
			render plain: response
		else
			render plain: response
		end
	end

	def create
		t = DateTime.now
		if (!User.find_by(email: params.permit(:email)[:email]).nil?)
			modify_membership
		else
			emailValid = User.validate_email(params.permit(:email)["email"])
			if (emailValid)
				em = User.get_email_address_only(params.permit(:email)[:email])
				if ((!params[:membership_level] != "premium") && (!params[:membership_level] != "free"))
					params[:membership_level] = PricePlan.find_by(url_code: params.permit(:membership_level)[:membership_level]).name
				end
				u = User.new(email: em, email_verified: false, email_verification_code: nil, unsubscribe_code: nil, date_joined: t, membership_level: params.permit(:membership_level)[:membership_level], date_current_membership_level: t, membership_level_history: nil)
				mc = params[:membership_code].to_s
				output = "bad"
				if u.save
					result = 1
					u.reload
					u.email_verification_code = User.createEmailVerificationCode
					u.unsubscribe_code = User.createUnsubscribeCode
					membership_level_history = {}
					membership_level_history["level"] = params.permit(:membership_level)[:membership_level].to_s
					membership_level_history["date"] = t
					u.membership_level_history = JSON.generate(membership_level_history)
					if mc == "2"
						result = Subscription.subscribe(u, params.permit(:stripe_token_id)[:stripe_token_id], params.permit(:email)[:email], params.permit(:membership_level)[:membership_level])
					end
					if (mc == "2" && result == 2)
						u.delete
					else
						u.save
						UserMailer.welcome_email(u.email, u.id).deliver_now
						output = "good"
					end
					if (!params.permit("visitID")["visitID"].nil?)
						v = Visit.find(params.permit("visitID")["visitID"])
						v.signed_up = true
						v.date_signed_up = DateTime.now
						if (u.present?)
							v.user_id = u.id
						end
						v.save
					end
				end
				render plain: output
			else
				render plain: "good"
			end
		end
	end

	def modify_membership
		u = User.find_by(email: params[:email])
		if ((!params[:membership_level] != "premium") && (!params[:membership_level] != "free"))
			params[:membership_level] = PricePlan.find_by(url_code: params.permit(:membership_level)[:membership_level]).name
		end
		result = 1
		output = "good"
		if ((u.membership_level == "free") && (params[:membership_level] != "free"))
			result = Subscription.subscribe(u, params.permit(:stripe_token_id)[:stripe_token_id], params.permit(:email)[:email], params.permit(:membership_level)[:membership_level])
		elsif ((u.membership_level != "free") && (params[:membership_level] == "free"))
			Subscription.cancel_subscription(u.subscription.subscription_id)
			u.subscription.delete
		elsif ((u.membership_level != "free") && (params[:membership_level] != "free"))
			Subscription.cancel_subscription(u.subscription.subscription_id)
			u.subscription.delete
			result = Subscription.subscribe(u, params.permit(:stripe_token_id)[:stripe_token_id], params.permit(:email)[:email], params.permit(:membership_level)[:membership_level])
		end
		u.membership_level = params.permit(:membership_level)[:membership_level]
		u.save
		if (result == 2)
			output = "bad"
		end
		render plain: output
	end

	def unsubscribe
		@unsubscribe_result = 0
		user = User.find_by(email: params[:email].to_s, unsubscribe_code: params[:unsubscribe_code].to_s)
		if (user.present? && (user.membership_level.to_s == "free"))
			#user_challenges = UserChallenge.where(user_id: user.id)
			#if user_challenges.present?
			#	user_challenges.delete_all
			#end
			a = Unsubscribed.new(user.attributes.except("id","created_at","updated_at")) 
			a.user_id = user.id
			a.save
			user.delete 
			@unsubscribe_result = 1
		end
	end

	def show_subscriptions
		@users = User.order(:id)
		@landing_page_visits = Visit.where("from_blog = false").order(:id)
		@blog_visits = Visit.where("from_blog = true").order(:id)
		@ref_codes = RefCode.order(:id)
	end

end