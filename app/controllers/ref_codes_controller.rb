class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
		rc = RefCode.new(recipient_name: params["recipientName"], recipient_url: params["recipientURL"], recipient_email: params["recipientEmail"], email_content: params["emailContent"])
		rc.ref_code = RefCode.create_new_ref_code
		rc.ref_code_url = "https://www.dailyjavascript.io/?refCode="+rc.ref_code.to_s
		rc.save
		render plain: "it worked!"
	end

	def show_all
		output = []
		ref_codes = RefCode.all
		if (!ref_codes.empty?)
			ref_codes.each do |x|
				output.push({refCode: x.ref_code, refCodeURL: x.ref_code_url, recipientName: x.recipient_name, recipientURL: x.recipient_url, recipientEmail: x.recipient_email, emailContent: x.email_content})
			end
		end
		#render json: [{recipientName:"bootcamp",recipientURL:"http://bootcamp",recipientEmail:"watid2005"},{recipientName:"college",recipientURL:"http://college",recipientEmail:"farmingdale"}]
		render json: output
	end

end