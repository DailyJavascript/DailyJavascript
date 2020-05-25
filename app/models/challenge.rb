# frozen_string_literal: true

class Challenge < ApplicationRecord
  def self.mail_next_challenge
    users = User.where('id > 0').order(:id)
    if users.present?
      users.each do |user|
        user_challenges = UserChallenge.where(user_id: user.id)
        if user_challenges.present?
          last_challenge = user_challenges.order(:challenge_id).last
          next_challenge_id = last_challenge.challenge_id.to_i + 1
          next_challenge = Challenge.where(id: next_challenge_id.to_i).last
          if next_challenge.present? && ((DateTime.now >= last_challenge.date_sent.at_beginning_of_day.advance(hours: 24)) && (DateTime.now >= DateTime.now.at_beginning_of_day.advance(hours: 5)))
            uc = UserChallenge.new(user_id: user.id, challenge_id: next_challenge.id)
            UserMailer.next_challenge_email(uc.challenge_id, user.email, user.id).deliver_now
            uc.emailed = true
            uc.date_sent = DateTime.now
            uc.save
          end
        else
          first_challenge = Challenge.where('id > 0').order(:id).first
          if first_challenge.present? && (DateTime.now >= DateTime.now.at_beginning_of_day.advance(hours: 5))
            uc = UserChallenge.new(user_id: user.id, challenge_id: first_challenge.id)
            UserMailer.next_challenge_email(uc.challenge_id, user.email, user.id).deliver_now
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
      if DateTime.now >= last_user_challenge.date_sent.at_beginning_of_day.advance(hours: 24)
        t = Time.now
        if (t >= Time.now.at_beginning_of_day.advance(hours: 11)) && (t <= Time.now.at_beginning_of_day.advance(hours: 17))
          mail_next_challenge
        end
      end
    elsif challenges.present?
      t = Time.now
      if (t >= Time.now.at_beginning_of_day.advance(hours: 11)) && (t <= Time.now.at_beginning_of_day.advance(hours: 17))
        mail_next_challenge
      end
    end
  end

  def self.check_if_user_challenge_is_seven_then_send_out_first_product_feedback_email
    users = User.all
    if users.present?
      users.each do |user|
        if user.user_challenges.present? && user.user_challenges.order(:challenge_id).last.challenge_id == 7
          UserMailer.first_product_feedback_email(user.email).deliver_now
        end
      end
    end
  end
end
