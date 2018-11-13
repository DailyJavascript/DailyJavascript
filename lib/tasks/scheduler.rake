desc "This task is called by the Heroku scheduler add-on"
task :email_next_challenge => :environment do
  Challenge.check_if_next_challenge_has_been_sent_then_send_out_next_challenge
end