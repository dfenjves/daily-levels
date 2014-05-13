class StatusesController < ApplicationController

	def index
		@statuses = Status.all
	end

	def show
		set_status
	end

	def new
		@status = Status.new
	end

	def create
		@status = Status.new(status_params)
		if @status.save
			redirect_to root_path
		else
			flash[:error] = "Please Fill Out The Form!"
		end
	end

	private

	def set_status
		@status = Status.find(params[:id])
	end

	def status_params
		params.require(:status).permit(:dairy, :wheat, :meat, :coffee_cups, :notes, :date, :rating)
	end

end