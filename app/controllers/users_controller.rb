class UsersController < ApplicationController

	def index
		render 'index'
	end

	def preflight
		puts request.headers.inspect
		if request.headers[:HTTP_ORIGIN] == "https://goofy-ride-78f322.netlify.com" || request.headers[:HTTP_ORIGIN] == "http://goofy-ride-78f322.netlify.com"
			render plain: "proceed"
		else 
			render plain: "stop"
		end
	end

	def create
		t = DateTime.now
		u = User.new(email: params[:email], email_verified: false, email_verification_code: nil, unsubscribe_code: nil, date_joined: t, membership_level: params[:membershipLevel], date_current_membership_level: t, membership_level_history: nil)
		if u.save!
			render plain: "good"
		else 
			render plain: "bad"
		end
	end

end
