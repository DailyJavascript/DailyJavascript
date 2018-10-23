class UsersController < ApplicationController

	def index
		render 'index'
	end

	def create
		puts " "
		puts " "
		puts params[:email]
		render plain: "ok"
	end

end
