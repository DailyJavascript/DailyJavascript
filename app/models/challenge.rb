class Challenge < ApplicationRecord
	
	def self.mail_next_challenge
		users = User.all
		if users.present? 
			users.each do |user|
				user_challenges = UserChallenge.where(user_id: user.id)
				if user_challenges.present? 
					last_challenge = user_challenges.order(:challenge_id).last
					next_challenge_id = last_challenge.challenge_id.to_i + 1
					next_challenge = Challenge.find(next_challenge_id.to_i)
					# if ( next_challenge.present? && ( (DateTime.now >= last_challenge.date_sent.at_beginning_of_day.advance(hours: 24)) && (DateTime.now >= DateTime.now.at_beginning_of_day.advance(hours: 5)) ) )
						uc = UserChallenge.new(user_id: user.id, challenge_id: next_challenge.id)
						# UserMailer.next_challenge_email(uc.challenge_id, user.email, user.id).deliver_now
						uc.emailed = true
						uc.date_sent = DateTime.now
						uc.save
					# end
				else
					first_challenge = Challenge.where("id > 0").order(:id).first
					# if ( first_challenge.present? && (DateTime.now >= DateTime.now.at_beginning_of_day.advance(hours: 5)) )
					# 	uc = UserChallenge.new(user_id: user.id, challenge_id: first_challenge.id)
						# UserMailer.next_challenge_email(uc.challenge_id, user.email, user.id).deliver_now
						uc.emailed = true
						uc.date_sent = DateTime.now
						uc.save
					# end
				end
			end
		end
	end


	def self.check_if_next_challenge_has_been_sent_then_send_out_next_challenge
		last_user_challenge = UserChallenge.order(:date_sent).last
		challenges = Challenge.first
		if challenges.present? && last_user_challenge.present?
			if DateTime.now >= last_user_challenge.date_sent.at_beginning_of_day.advance(hours: 24)
				t = Time.now
				if ( (t >= Time.now.at_beginning_of_day.advance(hours: 11)) && (t <= Time.now.at_beginning_of_day.advance(hours: 17)) ) 
					mail_next_challenge
				end
			end
		elsif challenges.present?
			t = Time.now
			if ( (t >= Time.now.at_beginning_of_day.advance(hours: 11)) && (t <= Time.now.at_beginning_of_day.advance(hours: 17)) ) 
					mail_next_challenge
			end
		end
	end

	def self.insert_assertions(c_id, params)
		challenge = Challenge.find(c_id)

		left_assertions = []
		right_assertions = []
		test_function = params.permit(:testFunction)["testFunction"].strip
		
		3.downto(1) do |x|
			left_assertions.push(params.permit("assertion#{x}left")["assertion#{x}left"].strip)
			right_assertions.push(params.permit("assertion#{x}right")["assertion#{x}right"].strip)
		end
		
		assertions = ""
		
		left_assertions.length.times do |x|
			l_a = left_assertions.pop
			r_a = right_assertions.pop
			if !l_a.blank? && !r_a.blank?
				r_a_stripped = r_a.gsub("'","")
				assertions = "#{assertions}\n it('will return #{r_a_stripped}', function(){\n expect(#{test_function}(#{l_a})).toEqual(#{r_a})\n });"
			end
		end
		
		full_assertion_statement = "describe('#{test_function}', function(){  #{assertions} \n });"
		challenge.test_assertions = full_assertion_statement
		challenge.save
	end

end
