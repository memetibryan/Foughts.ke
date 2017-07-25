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

  get("/user") do
    @users = User.all()
    erb(:users)
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

  get("/users") do
    @users = User.all()
    erb(:users)
  end

  get("/event/new") do
    @hosts = Host.all()
  	erb(:event_form)
  end

  get("/host/new") do 
    erb(:host_form)
  end

  get("/user/new") do 
    erb(:user_form)
  end

  get('/users/:id') do
    @events = Event.all()
    @user = User.find(params.fetch("id").to_i())
    erb(:user_details)
  end

  get('/hosts/:id') do
    @events = Event.all()
    @host = Host.find(params.fetch("id").to_i())
    erb(:host_details)
  end

  get('/events/:id') do
    @users = User.all()
    @event = Event.find(params.fetch("id").to_i())
    erb(:events_details)
  end

  post("/events") do
    name = params.fetch("name")
    description = params.fetch("description")
    number_of_tickets = params.fetch("number_of_tickets")
    description = params.fetch("description")
    host_id = params.fetch("host_id").to_i()
    @host = Host.find(host_id)
    event = Event.new({:host_id => host_id,:name => name, :description => description, :number_of_tickets => number_of_tickets, :id => nil})
    if event.save()
      erb(:success)
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

  post("/users") do
    name = params.fetch(:name)
    Telephone = params.fetch(:Telephone)
    Email = params.fetch(:Email)
    user = User.new({:name => name, :Telephone => Telephone, :Email => Email, :id => nil})
    if user.save()
      redirect("/users")
    else
      erb(:errors)
    end
  end

  patch("/users/:id") do
    user_id = params.fetch("id").to_i()
    @user = User.find(user_id)
    event_ids = params.fetch("event_ids")
    @user.update({:event_ids => event_ids})
    @events = Event.all()
    redirect("/users")
  end

  delete("/events/:id") do
    @event = Event.find(params.fetch("id").to_i())
    if @event.destroy()
      redirect("/host")
    else
      erb(:errors)
    end
  end

  get("/events/:id/edit") do
    @event = Event.find(params.fetch("id").to_i())
    erb(:delete_event)
  end