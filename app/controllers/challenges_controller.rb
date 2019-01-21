class ChallengesController < ApplicationController

	def new
		#
	end

	def show
		if ['108', '103', '63'].include? params[:user_id]
			@challenge = Challenge.find(params[:id])
		else
			@challenge = Challenge.find(0)
		end
		render json: @challenge
	end

	def create
		c = Challenge.new(challenge: params.permit(:challenge)[:challenge])
		if (Challenge.count > 0)
			current_id = Challenge.order(:id).last.id.to_i + 1
			c.id = current_id
		end
		if c.save
			if params["notChallenge"] == "false"
				Challenge.insert_assertions(c.id, params)
				c.is_challenge = true
			else
				c.is_challenge = false
			end
			c.save
			if params[:code].to_i == 1
				Challenge.mail_next_challenge
			end
			render plain: "good"
		else
			render plain: "bad"
		end
	end

end
