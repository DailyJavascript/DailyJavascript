class ChallengesController < ApplicationController


	def new
	end

	def create
		puts params[:challenge]
		puts params[:code]
		c = Challenge.new(challenge: params[:challenge])
		if c.save
			if (Challenge.count > 0)
				current_id = Challenge.order(:id).last.id.to_i + 1
				c.id = current_id
				c.save
			end
			if params[:code].to_i == 1
				Challenge.mail_next_challenge
			end
			render plain: "good"
		else
			render plain: "bad"
		end
	end

end
