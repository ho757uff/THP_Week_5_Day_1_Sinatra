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

    new_gossip = Gossip.new(gossip_author, gossip_content)
    new_gossip.save

    puts "Merci pour ton potin copain !" # Ne sert à rien ! Ça va trop vite !
    redirect "/gossips/new/" # ou redirect "/"
  end
end

# binding.pry
