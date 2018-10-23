class UsersController < ApplicationController

	def index
		render 'index'
	end

	def create
		puts " "
		puts " "
		puts params[:email]
		puts " "
		puts request.headers
		puts " "
		puts request.headers.inspect
		render plain: "good good"
	end

end
