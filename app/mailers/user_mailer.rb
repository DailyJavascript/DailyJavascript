class UserMailer < ApplicationMailer
	default from: 'dailyjavascript@sendgrid.net'

	def welcome_email(user_email_address, user_id)
		@user = User.find(user_id)
		mail(to: user_email_address, subject: 'Welcome to Daily Javascript')
	end


	def next_challenge_email(challenge_id, user_email_address, user_id)
		@user = User.find(user_id)
		@next_challenge = Challenge.find(challenge_id)
		mail(to: user_email_address, subject: "Today's Daily Javascript email")
	end
end
