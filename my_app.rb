require 'sinatra'

class MyApp < Sinatra::Base
  get "/" do #defining a place to go - this would be the homepage
    erb :index #erb looks for a file and reads it
  end
  get "/about-me" do
    "All about me!!"
  end

end
