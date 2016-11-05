Demo::Application.routes.draw do
  resources :people
    get "welcome/say_hello" => "welcome#say"

    get "welcome" => "welcome#index"
    # ...
    root :to => "welcome#index"

    #match ':controller(/:action(/:id(.:format)))', :via => :all

    resources :events do
 	resources :attendees, :controller => "event_attendees"
	end
end