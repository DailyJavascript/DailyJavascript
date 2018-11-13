class Challenge < ApplicationRecord
	has_many :users
	#has_one :test


	def self.mail_next_challenge
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
						UserMailer.next_challenge_email(uc.challenge_id, user.email).deliver_now
						uc.emailed = true
						uc.date_sent = DateTime.now
						uc.save
					end
				else
					first_challenge = Challenge.find(1)
					if first_challenge.present?
						uc = UserChallenge.new(user_id: user.id, challenge_id: 1)
						UserMailer.next_challenge_email(uc.challenge_id, user.email).deliver_now
						uc.emailed = true
						uc.date_sent = DateTime.now
						uc.save
					end
				end
			end
		end
	end


	def self.check_if_next_challenge_has_been_sent_then_send_out_next_challenge
		last_user_challenge = UserChallenge.order(:date_sent).last
		challenges = Challenge.first
		if challenges.present? && last_user_challenge.present?
			if DateTime.now.to_date == last_user_challenge.date_sent.to_date
				t = Time.now
				if ( (t >= Time.now.at_beginning_of_day.advance(hours: 6)) && (t <= Time.now.at_beginning_of_day.advance(hours: 20)) ) 
					mail_next_challenge
				end
			end
		elsif challenges.present?
			mail_next_challenge
		end
	end


end
