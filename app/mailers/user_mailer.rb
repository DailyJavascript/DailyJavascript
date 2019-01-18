class UserMailer < ApplicationMailer
	default from: 'Daily JavaScript <support@dailyjavascript.io>'

	def welcome_email(user_email_address, user_id)
		@user = User.find(user_id)
		mail(to: user_email_address, subject: 'Welcome to Daily JavaScript')
	end


	def next_challenge_email(challenge_id, user_email_address, user_id)
		@user = User.find(user_id)
		@next_challenge = Challenge.find(challenge_id)
		mail(from: 'Daily JavaScript <challenges@dailyjavascript.io>', to: user_email_address, subject: "Daily JavaScript: Email #{challenge_id}")
	end

	def invite_email(recipient_email, status, email_content, rc_url)
		@status = status
		@email_content = email_content
		@link = "https://www.dailyjavascript.io/"+rc_url
		mail(to: recipient_email, subject: "Improve your programming skills and get prepped for your coding interview - become a member of Daily Javascript")
	end

	def first_product_feedback_email(user_email_address)
		@recipient_email = user_email_address
		mail(to: @recipient_email, subject: "Help us help you.")
	end

	def apology_email(user_email_address)
		@recipient_email = user_email_address
		mail(to: @recipient_email, subject: "We're sorry.")
	end
end
