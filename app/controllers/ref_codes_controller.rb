class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
	end

	def show_all
		#render json: [{recipientName:"bootcamp",recipientURL:"http://bootcamp",recipientEmail:"watid2005"},{recipientName:"college",recipientURL:"http://college",recipientEmail:"farmingdale"}]
		render json: []
	end

end