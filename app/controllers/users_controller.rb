class UsersController < ApplicationController

	def index
		render 'index'
	end

	def preflight
		puts request.headers
		render plain: "proceed"
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
