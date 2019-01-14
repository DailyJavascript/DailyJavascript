class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
		rc = RefCode.new(recipient_name: params.permit("recipientName")["recipientName"], recipient_url: params.permit("recipientURL")["recipientURL"], recipient_email: params.permit("recipientEmail")["recipientEmail"], email_content: params.permit("emailContent")["emailContent"])
		rc.ref_code = RefCode.create_new_ref_code
		rc.ref_code_url = "?refcode="+rc.ref_code.to_s
		rc.save
		if (!params.permit("recipientEmail")["recipientEmail"].to_s.blank? && params.permit("emailContent")["emailContent"].to_s.blank?)
			UserMailer.invite_email(params.permit("recipientEmail")["recipientEmail"].to_s, 0, "", rc.ref_code_url).deliver_now
		elsif (!params.permit("recipientEmail")["recipientEmail"].to_s.blank? && !params.permit("emailContent")["emailContent"].to_s.blank?)
			UserMailer.invite_email(params.permit("recipientEmail")["recipientEmail"].to_s, 1, params.permit("emailContent")["emailContent"].to_s, rc.ref_code_url).deliver_now
		end
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