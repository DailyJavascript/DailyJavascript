class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
	end

	def show_all
		data = { name: "bootcamp", url: "http://bootcamp", email: "watid2005" }
		render json: data
	end

end