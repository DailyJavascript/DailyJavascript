class GetSeeds < ApplicationRecord


	def self.get_refcodes
		RefCode.order(:id).each do |x|
			puts "RefCode.create(RefCode.create(ref_code:"+x.ref_code.inspect+", ref_code_url:"+x.ref_code_url.inspect+", recipient_name:"+x.recipient_name.inspect+", recipient_url:"+x.recipient_url.inspect+")"
		end
	end

	def self.get_challenges
		Challenge.order(:id).each do |x|
			puts "Challenge.create(challenge:"+x.challenge.inspect+")"
		end
	end

end