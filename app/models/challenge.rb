class Challenge < ApplicationRecord
	has_many :users
	#has_one :test


	def self.mail_out_challenges
		users = User.all
		if users.present? 
			users.each do |user|
				user_challenges = UserChallenge.where(:user_id => user.id)
				if user_challenges.present? 
					last_challenge = user_challenges.order(:challenge_id).last
					next_challenge_id = last_challenge.challenge_id.to_i + 1
					next_challenge = Challenge.find(next_challenge_id.to_i)
					if next_challenge.present?
						uc = UserChallenge.new(user_id: user.id, challenge_id: next_challenge.id)
						UserMailer.next_challenge_email(uc.challenge_id, uc.user_id).deliver_now
						uc.emailed = true
						uc.date_sent = DateTime.now
						uc.save
					end
				else
					first_challenge = Challenge.find(1)
					if first_challenge.present?
						uc = UserChallenge.new(user_id: user.id, challenge_id: 1)
						UserMailer.next_challenge_email(uc.challenge_id, uc.user_id).deliver_now
						uc.emailed = true
						uc.date_sent = DateTime.now
						uc.save
					end
				end
			end
		end
	end


end
