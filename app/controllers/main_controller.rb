class MainController < ApplicationController
	protect_from_forgery
	before_filter :require_login

	def index
	end

end