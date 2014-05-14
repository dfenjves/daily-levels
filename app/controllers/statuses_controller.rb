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
			flash[:success] = "Successfully created new daily status"
		else
			if params[:coffee_cups] = ""
				flash[:error] = "Please add coffee consumption"
				render "new"
			elsif params[:rating] = ""
				flash[:error] = "Please add a daily rating"
				render "new"
			end
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