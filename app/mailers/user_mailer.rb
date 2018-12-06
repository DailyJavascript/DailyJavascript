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

	def invite_email(recipient_email, status, email_content, rc_url)
		@status = status
		@email_content = email_content
		@link = "https://www.dailyjavascript.io/"+rc_url
		mail(to: recipient_email, subject: "Improve your programming skills and get prepped for your coding interview - become a member of Daily Javascript")
	end
end
