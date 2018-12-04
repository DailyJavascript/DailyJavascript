class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
	end

	def show_all
		data = {}
		data["name"] =  "bootcamp"
		data["url"] = "http://bootcamp"
		data["email"] = "watid2005" 
		render json: data
	end

end