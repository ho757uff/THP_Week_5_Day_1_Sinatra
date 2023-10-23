require_relative "gossip"
require "pry"

class ApplicationController < Sinatra::Base
  get "/" do
    erb :index, locals: {gossips: Gossip.all}
  end

  get "/gossips/new/" do
    erb :new_gossip
  end

  post "/gossips/new/" do
    gossip_author = params["gossip_author"]
    gossip_content = params["gossip_content"]
    next_id = Gossip.next_id

    new_gossip = Gossip.new(gossip_author, gossip_content)
    new_gossip.id = next_id

    new_gossip.save
    redirect "/" # ou redirect "/gossips/new/"
  end

  get "/gossips/:id" do
    id = params[:id].to_i # Convert the ID to an integer
    gossip = Gossip.find(id)
    if gossip
      erb :show, locals: {gossip: gossip}
    else
      "Gossip not found." # This is a simple error message for now.
    end
  end
end # End of class - "ApplicationController"
# End of file - "controller.rb"

# binding.pry
