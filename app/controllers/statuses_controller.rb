class StatusesController < ApplicationController

	def index
		if signed_in?
		@statuses = current_user.statuses.all
		end
		@status = Status.new
	end

	def show
		set_status
	end

	def new
		@status = Status.new
	end

	def create
		@status = current_user.statuses.new(status_params)
		if @status.save
			redirect_to root_path
			flash[:success] = "Successfully created new daily status"
		else
				render "new"
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