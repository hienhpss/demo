class EventsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy]
	def index
		@events = Event.all
		@events =Event.new
		#@events = Event.page(params[:page]).per(5)
	end

 	def create
	 	@event = Event.new(event_params)
		if @event.save
			redirect_to :action => :index
			flash[:notice] = "event was successfully created"
		else
			render :action => :new
		end

 	end

 	private
 	def event_params
 		params.require(:event).permit(:name, :description)
 	end

 	def show
 	end

 	def edit
 	end

 	def update
		if @event.update(event_params)
			redirect_to :action => :show, :id => @event
		else
			render :action => :edit
		end
 	end

 	def destroy
	 	@event.destroy
	 	redirect_to :action => :index
	 	flash[:alert] = "event was successfully deleted"
 	end

 	def set_event
	 	@event = Event.find(params[:id])
	end
end
