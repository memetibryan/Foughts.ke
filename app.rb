require("bundler/setup")
  Bundler.require(:default)
  also_reload("lib/**/*.rb")

  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file } #loading individual files when required

  #loads first web page 'index'
  get("/") do
    erb(:index)
  end

  get("/event") do
  	@events = Event.all()
  	erb(:events)
  end
  

  get("/host") do
    @hosts = Host.all()
    erb(:hosts)
  end

  get("/events") do
  	@events = Event.all()
  	erb(:events)
  end

  get("/hosts") do
    @hosts = Host.all()
    erb(:hosts)
  end

  get("/event/new") do 
  	erb(:event_form)
  end

  get("/host/new") do 
    erb(:host_form)
  end

  post("/events") do
  	name = params.fetch(:name)
  	description = params.fetch(:description)
  	number_of_tickets = params.fetch(:number_of_tickets)
  	event = Event.new({:name => name, :description => description, :number_of_tickets => number_of_tickets, :id => nil})
  	if event.save()
  		redirect("/events")
  	else
  		erb(:errors)
  	end
  end

  post("/hosts") do
    name = params.fetch(:name)
    Telephone = params.fetch(:Telephone)
    Email = params.fetch(:Email)
    host = Host.new({:name => name, :Telephone => Telephone, :Email => Email, :id => nil})
    if host.save()
      redirect("/hosts")
    else
      erb(:errors)
    end
  end