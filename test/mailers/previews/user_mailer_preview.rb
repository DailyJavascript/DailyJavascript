# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first).welcome_email(User.first.email, User.first.id)
  end

  def next_challenge_email
    UserMailer.with(user: User.first).next_challenge_email(1, User.first.email, User.first.id)
  end
end
