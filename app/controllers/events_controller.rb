class EventsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy]
	def new
 		@event = Event.new
 	end

	def index
		@events = Event.all
		#@events = Event.page(params[:page]).per(5)
	end

 	def create
	 	@event = Event.new(event_params)

		if @event.save
			#redirect_to :action => :index
			redirect_to events_url
			flash[:notice] = "event was successfully created"

		else
			render :action => :new
		end
		

 	end

 	def show
 	end

 	def edit
 	end

 	def update
		if @event.update(event_params)
			flash[:notice] = "event was successfully updated!"
			#redirect_to :action => :show, :id => @event
			redirect_to event_url(@event)
			#***RESTful**** redirect_to event_path(@event) # events/:id
			# event_path(@event) # events/:id
			# event_url(@event) # http://localhost:3000/events/:id 
		else
			render :action => :edit
		end
 	end

 	def destroy
	 	@event.destroy
	 	redirect_to :action => :index
	 	flash[:alert] = "event was successfully deleted"
 	end

 	def latest
 		@latest_events = Event.order("id DESC").limit(3)
 	end
 	

 	private
	#protected
 	def event_params
 		params.require(:event).permit(:name, :description,
:category_id, :group_ids => [])
 	end
 	
 	
 	#def event_params
 	#	params.require(:event).permit(:name, :description)
 	#end
 	 	def set_event
	 	@event = Event.find(params[:id])
	end
end
