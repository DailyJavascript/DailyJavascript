class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
	end

	def show_all
		render json: [{name:"bootcamp",url:"http://bootcamp",email:"watid2005"},{name:"college",url:"http://college",email:"farmingdale"}]
	end

end