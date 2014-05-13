class StatusesController < ApplicationController

	def index
		@statuses = Status.all
	end

	def new
		@status = Status.new
	end

end