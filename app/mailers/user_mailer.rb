class UserMailer < ApplicationMailer
	default from: 'dailyjavascript@sendgrid.net'

	def welcome_email
		email = em
		mail(to: em, subject: 'Welcome to Daily Javascript')
	end

end
