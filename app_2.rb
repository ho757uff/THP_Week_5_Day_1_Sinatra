require "sinatra"

class MyProjectApp < Sinatra::Base
  # set :run, true

  get "/" do
    "Hello World"
  end

  get "/hello" do
    "<h1>Hello world ! </h1>"
  end
end

MyProjectApp.run! if __FILE__ == $0
