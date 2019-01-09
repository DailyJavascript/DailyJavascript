class GetSeeds < ApplicationRecord


	def self.get_refcodes
		RefCode.order(:id).each do |x|
			puts "RefCode.create(id: "+x.id.inspect+", ref_code:"+x.ref_code.inspect+", ref_code_url:"+x.ref_code_url.inspect+", recipient_name:"+x.recipient_name.inspect+", recipient_url:"+x.recipient_url.inspect+")"
		end
	end

	def self.get_challenges
		Challenge.order(:id).each do |x|
			puts "Challenge.create(id: "+x.id.inspect+", challenge:"+x.challenge.inspect+", challenge_no:"+x.challenge_no.inspect+", level:"+x.level.inspect+", test_assertions:"+x.test_assertions.inspect+", test_url:"+x.test_url.inspect+", video_explanation_url:"+x.video_explanation_url.inspect+", is_challenge:"+x.is_challenge.inspect+")"
		end
	end

end