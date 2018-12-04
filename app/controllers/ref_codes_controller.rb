class RefCodesController < ApplicationController
layout "ref_codes"

	def index
	end

	def create
	end

	def show_all
		render plain: { :name => "bootcamp", :url => "http://bootcamp", :email => "watid2010"}.to_json
	end

end